import UIKit

final class ProfileViewController: UIViewController {
    // MARK: - Properties

    // MARK: Public

    // MARK: Private
    private let logoImage = UIImageView()
    private let tabBarView = UIView()
    private let tabBarLabel = UILabel()
    private let tabBarButtonQuestion = UIButton()
    private let tabBarButtonSettings = UIButton()
    private let loginLabel = UILabel()
    private var loginTextField = UITextField()
    private let passwordLabel = UILabel()
    private var passwordTextField = UITextField()
    private let securityButton = UIButton()
    private let forgotYourPasswordButton = UIButton()
    private let forgotView = UIView()
    private let orView = UIView()
    private let orLabel = UILabel()
    private let googleLogoButton = UIButton()
    private let facebookLogoButton = UIButton()
    private let appleLogoButton = UIButton()
    private let signInButton = UIButton()
    private let signUpButton = UIButton()
    private let signUpView = UIView()
    
    private let popUpWindowView = UIView()
    private let closePopUpWindowButton = UIButton()
    private let logoPopUpWindowImage = UIImageView()
    private let popUpWindowSignUpButton = UIButton()
    private let popUpWindowSignInButton = UIButton()
    private let textPopUpWindow = UITextView()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstrainsView()
//        setupConstrainsTabBar()
//        setupTabBar()
        setupUI()
        popUpWindowSetupConstrains()
        setupPopUpWindow()
    }

    // MARK: - API

    // MARK: - Setups
    private func addSubviews() {
        view.addSubview(logoImage)
        view.addSubview(tabBarView)
        tabBarView.addSubview(tabBarLabel)
        tabBarView.addSubview(tabBarButtonQuestion)
        tabBarView.addSubview(tabBarButtonSettings)
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(securityButton)
        view.addSubview(forgotYourPasswordButton)
        forgotYourPasswordButton.addSubview(forgotView)
        view.addSubview(orView)
        orView.addSubview(orLabel)
        view.addSubview(googleLogoButton)
        view.addSubview(facebookLogoButton)
        view.addSubview(appleLogoButton)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        view.addSubview(signUpView)
        view.addSubview(popUpWindowView)
        popUpWindowView.addSubview(closePopUpWindowButton)
        popUpWindowView.addSubview(logoPopUpWindowImage)
        popUpWindowView.addSubview(popUpWindowSignUpButton)
        popUpWindowView.addSubview(popUpWindowSignInButton)
        popUpWindowView.addSubview(textPopUpWindow)

    }

    private func setupConstrainsTabBar() {
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

    private func setupConstrainsView() {
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
        forgotView.topAnchor.constraint(equalTo: forgotYourPasswordButton.bottomAnchor, constant: 0).isActive = true
        forgotView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        forgotView.centerXAnchor.constraint(equalTo: forgotYourPasswordButton.centerXAnchor, constant: 0).isActive = true
        forgotView.leadingAnchor.constraint(equalTo: forgotYourPasswordButton.leadingAnchor, constant: 5).isActive = true
        forgotView.trailingAnchor.constraint(equalTo: forgotYourPasswordButton.trailingAnchor, constant: -5).isActive = true

        orView.translatesAutoresizingMaskIntoConstraints = false
        orView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 53).isActive = true
        orView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        orView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        orView.heightAnchor.constraint(equalToConstant: 1).isActive = true

        orLabel.translatesAutoresizingMaskIntoConstraints = false
        orLabel.centerYAnchor.constraint(equalTo: orView.centerYAnchor, constant: 0).isActive = true
        orLabel.centerXAnchor.constraint(equalTo: orView.centerXAnchor, constant: 0).isActive = true
        orLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        orLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true

        facebookLogoButton.translatesAutoresizingMaskIntoConstraints = false
        facebookLogoButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 18).isActive = true
        facebookLogoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        facebookLogoButton.widthAnchor.constraint(equalToConstant: 43).isActive = true
        facebookLogoButton.heightAnchor.constraint(equalToConstant: 43).isActive = true

        googleLogoButton.translatesAutoresizingMaskIntoConstraints = false
        googleLogoButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 18).isActive = true
        googleLogoButton.trailingAnchor.constraint(equalTo: facebookLogoButton.leadingAnchor, constant: -20).isActive = true
        googleLogoButton.widthAnchor.constraint(equalToConstant: 43).isActive = true
        googleLogoButton.heightAnchor.constraint(equalToConstant: 43).isActive = true

        appleLogoButton.translatesAutoresizingMaskIntoConstraints = false
        appleLogoButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 18).isActive = true
        appleLogoButton.leadingAnchor.constraint(equalTo: facebookLogoButton.trailingAnchor, constant: 20).isActive = true
        appleLogoButton.widthAnchor.constraint(equalToConstant: 43).isActive = true
        appleLogoButton.heightAnchor.constraint(equalToConstant: 43).isActive = true
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.topAnchor.constraint(equalTo: facebookLogoButton.bottomAnchor, constant: 31).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 12).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        signUpView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 1).isActive = true
        signUpView.leadingAnchor.constraint(equalTo: signUpButton.leadingAnchor, constant: 20).isActive = true
        signUpView.trailingAnchor.constraint(equalTo: signUpButton.trailingAnchor, constant: -20).isActive = true
        signUpView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    private func popUpWindowSetupConstrains(){
        popUpWindowView.translatesAutoresizingMaskIntoConstraints = false
        popUpWindowView.topAnchor.constraint(equalTo: view.topAnchor, constant: 85).isActive = true
        popUpWindowView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -198).isActive = true
        popUpWindowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        popUpWindowView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        closePopUpWindowButton.translatesAutoresizingMaskIntoConstraints = false
        closePopUpWindowButton.topAnchor.constraint(equalTo: popUpWindowView.topAnchor, constant: 11).isActive = true
        closePopUpWindowButton.trailingAnchor.constraint(equalTo: popUpWindowView.trailingAnchor, constant: -11).isActive = true
        closePopUpWindowButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closePopUpWindowButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    
        
    }
    
    
    private func setupTabBar() {
        tabBarView.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        tabBarView.layer.cornerRadius = 20
        tabBarLabel.text = "Профиль"
        tabBarLabel.font = .systemFont(ofSize: 20)
        tabBarLabel.textColor = UIColor(red: 0.171, green: 0.166, blue: 0.192, alpha: 1)

        tabBarButtonQuestion.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        tabBarButtonQuestion.tintColor = .orange
        
        tabBarButtonSettings.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        tabBarButtonSettings.contentScaleFactor = 1.5
        tabBarButtonSettings.tintColor = .orange
    }

    private func setupUI() {
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
        passwordTextField.textAlignment = .natural
        
        securityButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        securityButton.tintColor = UIColor(red: 0.171, green: 0.166, blue: 0.192, alpha: 1)

        forgotYourPasswordButton.setTitle("Забыли пароль?", for: .normal)
        forgotYourPasswordButton.setTitleColor(UIColor(red: 0.171, green: 0.166, blue: 0.192, alpha: 1), for: .normal)
        forgotYourPasswordButton.titleLabel?.font = .systemFont(ofSize: 13)
        forgotYourPasswordButton.titleLabel?.textAlignment = .left

        forgotView.backgroundColor = .black
        forgotView.layer.opacity = 0.8

        orView.backgroundColor = .gray
        orView.layer.opacity = 0.8

        orLabel.text = "ИЛИ"
        orLabel.backgroundColor = .white
        orLabel.textColor = .black
        orLabel.textAlignment = .center

        googleLogoButton.setImage(UIImage(named: "Google"), for: .normal)
        facebookLogoButton.setImage(UIImage(named: "facebook"), for: .normal)
        appleLogoButton.setImage(UIImage(named: "Apple"), for: .normal)
        googleLogoButton.layer.borderWidth = 1
        googleLogoButton.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        googleLogoButton.layer.cornerRadius = 21.5

        facebookLogoButton.layer.borderWidth = 1
        facebookLogoButton.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        facebookLogoButton.layer.cornerRadius = 21.5

        appleLogoButton.layer.borderWidth = 1
        appleLogoButton.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        appleLogoButton.layer.cornerRadius = 21.5

        signInButton.setTitle("Войти", for: .normal)
        signInButton.backgroundColor = UIColor(red: 0.929, green: 0.361, blue: 0.114, alpha: 1)
        signInButton.layer.cornerRadius = 10
        
        signUpButton.setTitle("Зарегистрироваться", for: .normal)
        signUpButton.setTitleColor(UIColor(red: 0.929, green: 0.361, blue: 0.114, alpha: 1), for: .normal)
        
        signUpView.backgroundColor = UIColor(red: 0.929, green: 0.361, blue: 0.114, alpha: 1)
        
        securityButton.addTarget(self, action: #selector(securityEyeAction), for: .touchUpInside)
    }

    private func setupPopUpWindow(){
        popUpWindowView.backgroundColor = .red
        closePopUpWindowButton.setTitle("X", for: .normal)
        closePopUpWindowButton.setTitleColor(.black, for: .normal)
        closePopUpWindowButton.addTarget(self, action: #selector(closeWindowPopUp), for: .touchUpInside)
        
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
    
    @objc func closeWindowPopUp(){
        popUpWindowView.isHidden = true
        
        
        popUpWindowView.backgroundColor = .yellow

    }
}
