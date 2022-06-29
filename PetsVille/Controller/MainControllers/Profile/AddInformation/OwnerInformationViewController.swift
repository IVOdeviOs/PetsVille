import UIKit

final class OwnerInformationViewController: UIViewController {
    // MARK: - Properties
    // MARK: Public

    // MARK: Private
    private let appearance = UINavigationBarAppearance()
    private let backButton = UIBarButtonItem()
    private let ownerImage = UIImageView()
    private let imageLabel = UILabel()
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstrains()
        setupUI()
        setupNavigationBar()
    }

    // MARK: - API

    // MARK: - Setups
    private func addSubviews() {
        view.addAllSubviews(ownerImage,imageLabel)
    }
    private func setupConstrains() {
        ownerImage.translatesAutoresizingMaskIntoConstraints = false
        ownerImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 118).isActive = true
        ownerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        ownerImage.widthAnchor.constraint(equalToConstant: 156).isActive = true
        ownerImage.heightAnchor.constraint(equalToConstant: 156).isActive = true
        
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        imageLabel.topAnchor.constraint(equalTo: ownerImage.bottomAnchor, constant: 0).isActive = true
        imageLabel.centerXAnchor.constraint(equalTo: ownerImage.centerXAnchor, constant: 0).isActive = true
        imageLabel.widthAnchor.constraint(equalToConstant: 271).isActive = true
        imageLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    private func setupUI() {
        view.backgroundColor = .white
        
        ownerImage.image = UIImage(named: "Hello")
        ownerImage.layer.borderColor = UIColor(red: 0.569, green: 0.569, blue: 0.569, alpha: 1).cgColor
        ownerImage.layer.borderWidth = 1
        ownerImage.layer.cornerRadius = 8
        
        imageLabel.text = "Выбрать изображение профиля"
        imageLabel.textColor = UIColor(red: 0.171, green: 0.166, blue: 0.192, alpha: 1)
        imageLabel.font = .systemFont(ofSize: 16)
        imageLabel.textAlignment = .center
    }
    private func setupNavigationBar() {
        title = "Профиль"
        backButton.title = ""

        appearance.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.layer.cornerRadius = 20
        
        
    }
    // MARK: - Helpers
}
