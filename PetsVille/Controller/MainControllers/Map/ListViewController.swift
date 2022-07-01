import UIKit

final class ListViewController: UIViewController {

    // MARK: Private
    
    private var tableView = UITableView()
    private let separatorLine = UIView()
    var id: Int = 0
    private lazy var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    private let layout = UICollectionViewFlowLayout()
    private var arrayOfButtons: [String] = ["Клиники", "На карте", "Открыто", "Фото"]
     var arrayOfObject = [Object]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(id)
        print(arrayOfObject.count)
        appendingArrayOfObject()
        addSubviews()
        setupCollectionView()
        setupTableView()
        addConstraints()
        setupUI()
    }
    
    // MARK: - API
    
    
    // MARK: - Setups
    
    private func appendingArrayOfObject() {
        switch id {
        case 1:
            arrayOfObject = arrayOfClinics
            case 2:
            arrayOfObject = arrayOfShops
                case 3:
            arrayOfObject = arrayOfCafes
                    case 4:
            arrayOfObject = arrayOfWalkingGrounds
        default:
            arrayOfObject = arrayOfClinics
        }
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(separatorLine)
        view.addSubview(collectionView)
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        
//        tableView.separatorColor = UIColor(red: 255/255, green: 188/255, blue: 139/255, alpha: 1)
        self.tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
    }
    
    private func addConstraints() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 116).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        separatorLine.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 5).isActive = true
        separatorLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        separatorLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    private func setupUI() {
        
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        collectionView.backgroundColor = .white
        separatorLine.backgroundColor = UIColor(red: 254/255, green: 243/255, blue: 235/255, alpha: 1)
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
        return arrayOfObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell {
                cell.set(object: arrayOfObject[indexPath.row])
            let viewSeparatorLine = UIView(frame: CGRect(
                x: 0,
                y: cell.contentView.frame.size.height - 2.0,
                width: cell.contentView.frame.size.width,
                height: 2
            ))
            viewSeparatorLine.backgroundColor = UIColor(red: 254/255, green: 243/255, blue: 235/255, alpha: 1)
            cell.contentView.addSubview(viewSeparatorLine)
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
