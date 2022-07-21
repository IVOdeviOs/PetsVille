import UIKit

final class MedicineViewController: UIViewController {
    // MARK: Private
    // MARK: - Outlets
    private let tableView = UITableView()
    private let customHeaderView = UIView()
    private let customView = UIView()
    // MARK: Private
    // MARK: - Properties
    private var clinicsArray = arrayOfClinics {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        setupTableView()
        setupUI()
    }
    
    // MARK: Private
    // MARK: - Setups
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(customHeaderView)
    }
    
    private func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        customHeaderView.translatesAutoresizingMaskIntoConstraints = false
        customHeaderView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        customHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        customHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        customHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
        tableView.register(MedicineTableViewCell.self, forCellReuseIdentifier: MedicineTableViewCell.identifier)
        tableView.rowHeight = 285
    }
    
    private func setupUI() {
        title = "Медицина"
        view.backgroundColor = .white
        customHeaderView.backgroundColor = AppColor.grayColor
        setupNavigationBarUI()
    }
    
    private func setupNavigationBarUI() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.montserrat(20, .semibold)]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(questionButton))
        navigationItem.rightBarButtonItem?.tintColor = .orange
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "",
                                                                                         style: .plain,
                                                                                         target: self, action: #selector(backBarButtonAction))
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.uturn.backward")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.uturn.backward")
        navigationController?.navigationBar.tintColor = .black
    }
    
    // MARK: Private
    // MARK: - Actions
    @objc private func questionButton() {
        
    }
    
    @objc private func backBarButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: UITableViewDataSource, UITableViewDelegate
extension MedicineViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clinicsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MedicineTableViewCell.identifier, for: indexPath) as? MedicineTableViewCell {
            cell.setInfo(clinicsArray[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
}
