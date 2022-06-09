import UIKit

final class ProfileViewController: UIViewController {
    // MARK: - Properties

    // MARK: Public

    // MARK: Private
    private var logoImage = UIImageView()
    private var tabBarView = UIView()
    private var tabBarLabel = UILabel()
    private var tabBarButtonQuestion = UIButton()
    private var tabBarButtonSettings = UIButton()
    private var loginLabel = UILabel()
    private var loginTextField = UITextField()
    private var passwordLabel = UILabel()
    private var passwordTextField = UITextField()
    private var securityButton = UIButton()
    private var forgotYourPasswordButton = UIButton()
    private var forgotView = UIView()
    private var orView = UIView()
    private let orLable = UILabel()
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstrainsView()
        setupConstrainsTabBar()
        setupTabBar()
        setupUI()
    }

    // MARK: - API

    // MARK: - Setups
    func addSubviews() {
        view.addSubview(logoImage)
        view.addSubview(tabBarView)
        tabBarView.addSubview(tabBarLabel)
        tabBarView.addSubview(tabBarButtonQuestion)
        tabBarView.addSubview(tabBarButtonSettings)
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(securityButton) //
        view.addSubview(forgotYourPasswordButton)
        forgotYourPasswordButton.addSubview(forgotView)
        view.addSubview(orView)
        orView.addSubview(orLable)
    }

    func setupConstrainsTabBar() {
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tabBarView.heightAnchor.constraint(equalToConstant: 103).isActive = true

        tabBarLabel.translatesAutoresizingMaskIntoConstraints = false
        tabBarLabel.topAnchor.constraint(equalTo: tabBarView.topAnchor, constant: 66).isActive = true
        tabBarLabel.centerXAnchor.constraint(equalTo: tabBarView.centerXAnchor, constant: 0).isActive = true
        tabBarLabel.bottomAnchor.constraint(equalTo: tabBarView.bottomAnchor, constant: -13).isActive = true
        tabBarLabel.widthAnchor.constraint(equalToConstant: 99).isActive = true

        tabBarButtonQuestion.translatesAutoresizingMaskIntoConstraints = false
        tabBarButtonQuestion.topAnchor.constraint(equalTo: tabBarView.topAnchor, constant: 63).isActive = true
        tabBarButtonQuestion.leadingAnchor.constraint(equalTo: tabBarView.leadingAnchor, constant: 13).isActive = true
        tabBarButtonQuestion.bottomAnchor.constraint(equalTo: tabBarView.bottomAnchor, constant: -12).isActive = true
        tabBarButtonQuestion.widthAnchor.constraint(equalToConstant: 28).isActive = true
        tabBarButtonQuestion.heightAnchor.constraint(equalToConstant: 28).isActive = true

        tabBarButtonSettings.translatesAutoresizingMaskIntoConstraints = false
        tabBarButtonSettings.topAnchor.constraint(equalTo: tabBarView.topAnchor, constant: 61.92).isActive = true
        tabBarButtonSettings.trailingAnchor.constraint(equalTo: tabBarView.trailingAnchor, constant: -11.03).isActive = true
        tabBarButtonSettings.bottomAnchor.constraint(equalTo: tabBarView.bottomAnchor, constant: -12.47).isActive = true
        tabBarButtonSettings.widthAnchor.constraint(equalToConstant: 30.06).isActive = true
        tabBarButtonSettings.heightAnchor.constraint(equalToConstant: 30.06).isActive = true
    }

    func setupConstrainsView() {
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 82).isActive = true
        logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 56).isActive = true
        logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -56).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 263).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 263).isActive = true

        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 341).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        loginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -278).isActive = true
        loginLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        loginLabel.widthAnchor.constraint(equalToConstant: 72).isActive = true

        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 5).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginTextField.widthAnchor.constraint(equalToConstant: 325).isActive = true

        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -278).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        passwordLabel.widthAnchor.constraint(equalToConstant: 72).isActive = true

        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 325).isActive = true

        securityButton.translatesAutoresizingMaskIntoConstraints = false
        securityButton.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 16.25).isActive = true
        securityButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -16.25).isActive = true
        securityButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: -11.72).isActive = true
        securityButton.widthAnchor.constraint(equalToConstant: 18.08).isActive = true
        securityButton.heightAnchor.constraint(equalToConstant: 15.81).isActive = true
        
        forgotYourPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotYourPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5).isActive = true
        forgotYourPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        forgotYourPasswordButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
        forgotYourPasswordButton.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        forgotView.translatesAutoresizingMaskIntoConstraints = false
        forgotView.topAnchor.constraint(equalTo: forgotYourPasswordButton.bottomAnchor, constant: 1).isActive = true
        forgotView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        forgotView.centerXAnchor.constraint(equalTo: forgotYourPasswordButton.centerXAnchor, constant: 0).isActive = true
        forgotView.leadingAnchor.constraint(equalTo: forgotYourPasswordButton.leadingAnchor, constant: 4).isActive = true
        forgotView.trailingAnchor.constraint(equalTo: forgotYourPasswordButton.trailingAnchor, constant: -5).isActive = true

        orView.translatesAutoresizingMaskIntoConstraints = false
        orView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 53).isActive = true
        orView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        orView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        orView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        orLable.translatesAutoresizingMaskIntoConstraints = false
        orLable.centerYAnchor.constraint(equalTo: orView.centerYAnchor, constant: 0).isActive = true
        orLable.centerXAnchor.constraint(equalTo: orView.centerXAnchor, constant: 0).isActive = true
        orLable.widthAnchor.constraint(equalToConstant: 60).isActive = true
        orLable.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }

    func setupTabBar() {
        tabBarView.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        tabBarView.layer.cornerRadius = 20
        tabBarLabel.text = "Профиль"
        tabBarLabel.font = .systemFont(ofSize: 20)
        tabBarLabel.textColor = UIColor(red: 0.171, green: 0.166, blue: 0.192, alpha: 1)

        tabBarButtonQuestion.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        tabBarButtonQuestion.tintColor = .orange

        tabBarButtonSettings.setImage(UIImage(systemName: "gearshape"), for: .normal)
        tabBarButtonSettings.tintColor = .orange
    }

    func setupUI() {
        view.backgroundColor = .white
        logoImage.image = UIImage(named: "Logo")

        loginLabel.text = "Логин"
        loginLabel.font = .systemFont(ofSize: 16)
        loginLabel.textColor = UIColor(red: 0.171, green: 0.166, blue: 0.192, alpha: 1)

        loginTextField.placeholder = " Введите логин "
        loginTextField.layer.cornerRadius = 8
        loginTextField.layer.borderWidth = 1
        loginTextField.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor

        passwordLabel.text = "Пароль"
        passwordLabel.font = .systemFont(ofSize: 16)
        passwordLabel.textColor = UIColor(red: 0.171, green: 0.166, blue: 0.192, alpha: 1)

        passwordTextField.placeholder = " Введите пароль "
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor

        securityButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        securityButton.tintColor = UIColor(red: 0.171, green: 0.166, blue: 0.192, alpha: 1)
        
        forgotYourPasswordButton.setTitle("Забыли пароль?", for: .normal)
        forgotYourPasswordButton.setTitleColor(.black, for: .normal)
        forgotYourPasswordButton.titleLabel?.font = .systemFont(ofSize: 13)
        forgotYourPasswordButton.titleLabel?.textAlignment = .left
        
        forgotView.backgroundColor = .black
        forgotView.layer.opacity = 0.8
        
        orView.backgroundColor = .gray
        orView.layer.opacity = 0.8
        
        orLable.text = "ИЛИ"
        orLable.backgroundColor = .white
        orLable.textColor = .black
        orLable.textAlignment = .center
        
        securityButton.addTarget(self, action: #selector(securityEyeAction), for: .touchUpInside)
    }

    // MARK: - Helpers
    @objc func securityEyeAction(_ sender: UIButton) {

        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            securityButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = true

        } else {
            securityButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        }
    }
}
