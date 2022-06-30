import UIKit

final class ShowProfileViewController: UIViewController {

    // MARK: - Properties

    // MARK: Public

    // MARK: Private
    private let appearance = UINavigationBarAppearance()
    private let viewOwner = UIView()
    private var stackView = UIStackView()
    private let nameLabel = UILabel()
    private let countryLabel = UILabel()
    private let ageLabel = UILabel()
    private let imagePerson = UIImageView()
    private let tableView = UITableView()
    private let addPetsButton = UIButton()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupStackView()
        addSubviews()
        setupConstrains()
        setupUI()
        setupOwnerView()
        setupTableView()
    }

    // MARK: - API

    // MARK: - Setups
    private func addSubviews() {
        view.addAllSubviews(viewOwner, tableView, addPetsButton)
        viewOwner.addAllSubviews(stackView, imagePerson)
    }

    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [nameLabel, countryLabel, ageLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(PetsTableViewCell.self, forCellReuseIdentifier: PetsTableViewCell.reuseIdentifier)

    }

    private func setupConstrains() {
        viewOwner.translatesAutoresizingMaskIntoConstraints = false
        viewOwner.topAnchor.constraint(equalTo: view.topAnchor, constant: 118).isActive = true
        viewOwner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        viewOwner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        viewOwner.heightAnchor.constraint(equalToConstant: 169).isActive = true

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: viewOwner.topAnchor, constant: 39).isActive = true
        stackView.bottomAnchor.constraint(equalTo: viewOwner.bottomAnchor, constant: -58).isActive = true
        stackView.leadingAnchor.constraint(equalTo: viewOwner.leadingAnchor, constant: 41).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 150).isActive = true

        imagePerson.translatesAutoresizingMaskIntoConstraints = false
        imagePerson.topAnchor.constraint(equalTo: viewOwner.topAnchor, constant: 13).isActive = true
        imagePerson.bottomAnchor.constraint(equalTo: viewOwner.bottomAnchor, constant: -12).isActive = true
        imagePerson.trailingAnchor.constraint(equalTo: viewOwner.trailingAnchor, constant: -26).isActive = true
        imagePerson.widthAnchor.constraint(equalToConstant: 144).isActive = true

        addPetsButton.translatesAutoresizingMaskIntoConstraints = false
        addPetsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        addPetsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        addPetsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -92).isActive = true
        addPetsButton.heightAnchor.constraint(equalToConstant: 52).isActive = true

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: viewOwner.bottomAnchor, constant: 17).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: addPetsButton.topAnchor, constant: -13).isActive = true
    }

    private func setupUI() {
        view.backgroundColor = .white
        nameLabel.text = "Имя"
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textColor = .black
        countryLabel.text = "Город"
        ageLabel.text = "Возраст"
        imagePerson.image = UIImage(named: "Hello")
        addPetsButton.setTitle("+ Добавить питомца", for: .normal)
        addPetsButton.setTitleColor(.black, for: .normal)
        addPetsButton.backgroundColor = UIColor(red: 1, green: 0.737, blue: 0.546, alpha: 1)
        addPetsButton.layer.cornerRadius = 8
    }

    private func setupOwnerView() {
        viewOwner.layer.borderWidth = 1
        viewOwner.layer.borderColor = UIColor(red: 0.929, green: 0.361, blue: 0.114, alpha: 1).cgColor
        viewOwner.layer.cornerRadius = 8
    }

    private func setupNavigationBar() {
        title = "Профиль"

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(settingsProfile))
        navigationItem.rightBarButtonItem?.tintColor = .orange

        appearance.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.layer.cornerRadius = 20
        navigationItem.hidesBackButton = true
    }

    // MARK: - Helpers
    @objc func settingsProfile() {}
}

extension ShowProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: PetsTableViewCell.reuseIdentifier,
                                                    for: indexPath) as? PetsTableViewCell {
            return cell
        }
        return UITableViewCell()
    }
  
    
    
}
