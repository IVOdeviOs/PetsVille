import UIKit

struct Menu {
    let image: UIImage
    let title: String
}

final class CareViewController: UIViewController {
    // MARK: Private
    // MARK: - Outlets
    private lazy var menuCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    private var searchController = UISearchController()
    private let searchBar = UISearchBar()
    private let navView = UIView()
    // MARK: Private
    // MARK: - Properties
    private let layout = UICollectionViewFlowLayout()
    private let pointsOfMenu: [Menu] = [
        Menu(image: UIImage(imageLiteralResourceName: "Nursing"), title: "Уход"),
        Menu(image: UIImage(imageLiteralResourceName: "Medicine"), title: "Медицина"),
        Menu(image: UIImage(imageLiteralResourceName: "Calendar"), title: "Календарь"),
        Menu(image: UIImage(imageLiteralResourceName: "Subscription"), title: "Подписка")
    ]
    // MARK: Private
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        setupMenuCollectionView()
        setupNavigationBar()
        setupUI()
        setupSearchBar()
    }
    // MARK: Private
    // MARK: - Setups
    private func addSubviews() {
        view.addAllSubviews(menuCollectionView, navView)
    }
    
    private func addConstraints() {
        menuCollectionView.translatesAutoresizingMaskIntoConstraints = false
        menuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        menuCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        menuCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 60).isActive = true
        
        navView.translatesAutoresizingMaskIntoConstraints = false
        navView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    private func setupMenuCollectionView() {
        menuCollectionView.register(CareCollectionViewCell.self, forCellWithReuseIdentifier: CareCollectionViewCell.identifier)
        layout.scrollDirection = .vertical
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menuCollectionView.backgroundColor = .clear
    }
    
    private func setupSearchController() {
//        searchController = UISearchController(searchResultsController: nil)
//        searchController.searchResultsUpdater = self
//        searchController.searchBar.placeholder = "Search"
//        navigationItem.searchController = searchController
//        searchController.searchBar.searchTextField.layer.masksToBounds = true
//        searchController.searchBar.searchTextField.layer.cornerRadius = 5
//        searchController.searchBar.barTintColor = .systemIndigo
        
        //Не забыть погуглить, что лучше: серчконтроллер или серчбар
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = AppColor.grayColor
        navigationController?.navigationBar.layer.cornerRadius = 20
        navigationController?.navigationBar.clipsToBounds = true
    }
    
    private func setupSearchBar() {
        navigationItem.titleView = searchBar
        searchBar.searchTextField.backgroundColor = .white
        searchBar.placeholder = "  Поиск"
        searchBar.searchTextField.font = .montserrat(17, .regular)
        searchBar.delegate = self
        searchBar.showsBookmarkButton = true
        searchBar.setImage(UIImage(systemName: "location"), for: .bookmark, state: .normal)
        searchBar.searchTextField.layer.borderWidth = 1
        searchBar.searchTextField.layer.borderColor = AppColor.orangeColor.cgColor
        searchBar.searchTextField.layer.cornerRadius = 10
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navView.backgroundColor = AppColor.grayColor
        navView.layer.cornerRadius = 20
    }
}
// MARK: - Actions
// MARK: Public
// MARK: - API
// MARK: - Helpers

//MARK: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewFlowLayout
extension CareViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pointsOfMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CareCollectionViewCell.identifier, for: indexPath) as? CareCollectionViewCell {
            cell.setInfo(pointsOfMenu[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width * 0.75
        let heigth = view.frame.height * 0.15
        
        return CGSize(width: width, height: heigth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 3, bottom: 10, right: 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let nursingVC = NursingViewController()
            navigationController?.pushViewController(nursingVC, animated: true)
            
        case 1:
            let medicineVC = MedicineViewController()
            navigationController?.pushViewController(medicineVC, animated: true)
            
        case 2:
            let calendarVC = CalendarViewController()
            navigationController?.pushViewController(calendarVC, animated: true)
        
        case 3:
            let subscriptionVC = SubscriptionViewController()
            navigationController?.pushViewController(subscriptionVC, animated: true)
            
        default:
            break
        }
        
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
