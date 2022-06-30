import UIKit

final class ListViewController: UIViewController {

    // MARK: Private
    
    private var tableView = UITableView()
    private let separatorLine = UIView()
    private lazy var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    private let layout = UICollectionViewFlowLayout()
    private var arrayOfButtons: [String] = ["Клиники", "На карте", "Открыто", "Фото"]
     var arrayOfClinics = [Object]() {
        didSet {
            tableView.reloadData()
        }
    }
     var arrayOfShops = [Object]() {
        didSet {
            tableView.reloadData()
        }
    }
     var arrayOfWalkingGrounds = [Object]() {
        didSet {
            tableView.reloadData()
        }
    }
     var arrayOfCafes = [Object]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupCollectionView()
        setupTableView()
        addConstraints()
        setupUI()
    }
    
    // MARK: - API
    
    
    // MARK: - Setups
    
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(separatorLine)
        view.addSubview(collectionView)
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor(red: 255/255, green: 188/255, blue: 139/255, alpha: 1)
        self.tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
    }
    
    private func addConstraints() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 116).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        separatorLine.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 0).isActive = true
        separatorLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        separatorLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: separatorLine.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    private func setupUI() {
        
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        collectionView.backgroundColor = .white
    }
    
    private func setupCollectionView() {
        collectionView.register(MapCollectionViewCell.self, forCellWithReuseIdentifier: MapCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = layout
        layout.itemSize = CGSize(width: 110, height: 32)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    // MARK: - Helpers
}

    // MARK: - Extensions
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let vc = MapViewController()
        switch vc.idToObjectsList {
        case 1:
            return arrayOfClinics.count
            case 2:
                return arrayOfShops.count
                case 3:
                    return arrayOfCafes.count
                    case 4:
                        return arrayOfWalkingGrounds.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell {
            let vc = MapViewController()
            switch vc.idToObjectsList {
            case 1:
                cell.set(object: arrayOfClinics[indexPath.row])
            case 2:
                cell.set(object: arrayOfShops[indexPath.row])
            case 3:
                cell.set(object: arrayOfCafes[indexPath.row])
            case 4:
                cell.set(object: arrayOfWalkingGrounds[indexPath.row])
            default:
                break
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = InfoAboutObjectViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfButtons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MapCollectionViewCell.identifier, for: indexPath) as? MapCollectionViewCell {
            cell.setButtonText(buttonText: arrayOfButtons[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}
