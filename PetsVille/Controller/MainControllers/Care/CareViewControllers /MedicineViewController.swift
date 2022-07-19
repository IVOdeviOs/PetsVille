import UIKit

final class MedicineViewController: UIViewController {
    
    private let tableView = UITableView()
    private var clinicsArray = arrayOfClinics {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        addConstraints()
        setupTableView()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
        tableView.register(MedicineTableViewCell.self, forCellReuseIdentifier: MedicineTableViewCell.identifier)
        tableView.rowHeight = 285
    }
}

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
