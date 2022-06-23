import UIKit

struct Menu {
    let image: UIImage
    let title: String
}

final class CareViewController: UIViewController {

    private lazy var menuCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    private let navBarAppearence = UINavigationBarAppearance()
    private var searchController = UISearchController()
    
    private let layout = UICollectionViewFlowLayout()
    
    private let dataSource: [Menu] = [
        Menu(image: UIImage(imageLiteralResourceName: "Nursing"), title: "Уход"),
        Menu(image: UIImage(imageLiteralResourceName: "Medicine"), title: "Медицина"),
        Menu(image: UIImage(imageLiteralResourceName: "Calendar"), title: "Календарь"),
        Menu(image: UIImage(imageLiteralResourceName: "Subscription"), title: "Подписка")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        setupMenuCollectionView()
        setupNavigationBar()
        setupSearchController()
    }
    
    private func addSubviews() {
        view.addSubview(menuCollectionView)
        view.backgroundColor = .white
    }
    
    private func addConstraints() {
        menuCollectionView.translatesAutoresizingMaskIntoConstraints = false
        menuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        menuCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        menuCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 60).isActive = true
    }

    private func setupMenuCollectionView() {
        menuCollectionView.register(CareCollectionViewCell.self, forCellWithReuseIdentifier: CareCollectionViewCell.identifier)
        layout.scrollDirection = .vertical
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
        
        menuCollectionView.backgroundColor = .clear
//        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
    }
    
    private func setupSearchController() {
            searchController = UISearchController(searchResultsController: nil)
            searchController.searchResultsUpdater = self
            searchController.searchBar.placeholder = "Search"
            navigationItem.searchController = searchController
            searchController.searchBar.searchTextField.layer.masksToBounds = true
            searchController.searchBar.searchTextField.layer.cornerRadius = 5
            searchController.searchBar.barTintColor = .systemIndigo
        }
    
    private func setupNavigationBar() { 
        navBarAppearence.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
//        navBarAppearence.layer.cornerRadius = 25
//        navBarAppearence.clipsToBounds = true
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearence
        navigationController?.navigationBar.layer.cornerRadius = 20
        navigationController?.navigationBar.clipsToBounds = true
//        navigationController?.navigationBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
    }
}


extension CareViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CareCollectionViewCell.identifier, for: indexPath) as? CareCollectionViewCell {
            cell.setInfo(dataSource[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let itemPerRow: CGFloat = 3
//        let paddingWidth = 10 * (itemPerRow + 1)
//        let widthForItem = collectionView.frame.width - paddingWidth
        let width = view.frame.width * 0.75
        let heigth = view.frame.height * 0.15
        
        return CGSize(width: width, height: heigth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 3, bottom: 10, right: 3)
    }
    
}

extension CareViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func filterContent(for SearchText: String) {
//        desiredArray = dataSource.filter { array -> Bool in
//            let nameOfCurrency = array.name.lowercased()
//                return nameOfCurrency.hasPrefix(SearchText.lowercased())
        }
    func updateSearchResults(for searchController: UISearchController) {
//        if let searchedText = searchController.searchBar.text {
//            filterContent(for: searchedText)
//            tableView.reloadData()
//        }
//    }
    }
}
