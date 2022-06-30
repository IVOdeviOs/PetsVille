import UIKit

final class OwnerInformationViewController: UIViewController {
    // MARK: - Properties
    // MARK: Public

    // MARK: Private
    private let appearance = UINavigationBarAppearance()
    private let backButton = UIBarButtonItem()
    private let ownerImage = UIImageView()
    private let imageLabel = UILabel()
    private let nameTextField = UITextField()
    private let bDayTextField = UITextField()
    private let phoneTextField = UITextField()
    private let countryTextFIeld = UITextField()
    private let aboutMeLabel = UILabel()
    private let aboutMeTextView = UITextView()
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstrains()
        setupUI()
        setupNavigationBar()
        setupTextField()
    }

    // MARK: - API

    // MARK: - Setups
    private func addSubviews() {
        view.addAllSubviews(ownerImage,
                            imageLabel,
                            nameTextField,
                            bDayTextField,
                            phoneTextField,
                            countryTextFIeld,
                            aboutMeLabel,
                            aboutMeTextView)
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

        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 45).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        bDayTextField.translatesAutoresizingMaskIntoConstraints = false
        bDayTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30).isActive = true
        bDayTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        bDayTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        bDayTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.topAnchor.constraint(equalTo: bDayTextField.bottomAnchor, constant: 30).isActive = true
        phoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        countryTextFIeld.translatesAutoresizingMaskIntoConstraints = false
        countryTextFIeld.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 30).isActive = true
        countryTextFIeld.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        countryTextFIeld.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        countryTextFIeld.heightAnchor.constraint(equalToConstant: 40).isActive = true

        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.topAnchor.constraint(equalTo: countryTextFIeld.bottomAnchor, constant: 30).isActive = true
        aboutMeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        aboutMeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        aboutMeLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true

        aboutMeTextView.translatesAutoresizingMaskIntoConstraints = false
        aboutMeTextView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 5).isActive = true
        aboutMeTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        aboutMeTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        aboutMeTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -88).isActive = true

        tabBarController?.tabBar.isHidden = true
    }

    private func setupTextField() {
        phoneTextField.keyboardType = .phonePad

        nameTextField.underlined(placeholders: "", text: "Имя")
        bDayTextField.underlined(placeholders: "", text: "Дата рождения")
        phoneTextField.underlined(placeholders: "", text: "Телефон")
        countryTextFIeld.underlined(placeholders: "", text: "Город")

        aboutMeLabel.text = "О себе"
        aboutMeLabel.textColor = UIColor(red: 0.569, green: 0.569, blue: 0.569, alpha: 1)

        aboutMeTextView.font = .systemFont(ofSize: 18)
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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    // MARK: - Helpers
}
