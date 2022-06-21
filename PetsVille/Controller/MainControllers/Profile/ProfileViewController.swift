import FacebookCore
import FacebookLogin
import FirebaseAuth
import SwiftUI
import UIKit

final class ProfileViewController: UIViewController {
    // MARK: - Properties

    // MARK: Public

    // MARK: Private
    private let logoImage = UIImageView()
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
    private let appearance = UINavigationBarAppearance()
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstrainsView()
        setupTabBar()
        setupUI()
        popUpWindowSetupConstrains()
        setupPopUpWindow()
    }

    // MARK: - API

    // MARK: - Setups
    private func addSubviews() {
        view.addAllSubviews(logoImage,
                            loginLabel,
                            loginTextField,
                            passwordLabel,
                            passwordTextField,
                            securityButton,
                            forgotYourPasswordButton,
                            orView,
                            googleLogoButton,
                            facebookLogoButton,
                            appleLogoButton,
                            signInButton,
                            signUpButton,
                            signUpView,
                            popUpWindowView)
        popUpWindowView.addAllSubviews(closePopUpWindowButton,
                                       logoPopUpWindowImage,
                                       popUpWindowSignUpButton,
                                       popUpWindowSignInButton,
                                       textPopUpWindow)
        forgotYourPasswordButton.addSubview(forgotView)
        orView.addSubview(orLabel)
    }

    private func setupConstrainsView() {
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 59).isActive = true
        logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 56).isActive = true
        logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -56).isActive = true
        logoImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -485).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 263).isActive = true

        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 0).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
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
        forgotYourPasswordButton.widthAnchor.constraint(equalToConstant: 130).isActive = true

        forgotView.translatesAutoresizingMaskIntoConstraints = false
        forgotView.topAnchor.constraint(equalTo: forgotYourPasswordButton.bottomAnchor, constant: 0).isActive = true
        forgotView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        forgotView.centerXAnchor.constraint(equalTo: forgotYourPasswordButton.centerXAnchor, constant: 0).isActive = true
        forgotView.leadingAnchor.constraint(equalTo: forgotYourPasswordButton.leadingAnchor, constant: 5).isActive = true
        forgotView.trailingAnchor.constraint(equalTo: forgotYourPasswordButton.trailingAnchor, constant: -5).isActive = true

        orView.translatesAutoresizingMaskIntoConstraints = false
        orView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        orView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        orView.heightAnchor.constraint(equalToConstant: 1).isActive = true

        orLabel.translatesAutoresizingMaskIntoConstraints = false
        orLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
        orLabel.centerYAnchor.constraint(equalTo: orView.centerYAnchor, constant: 0).isActive = true
        orLabel.centerXAnchor.constraint(equalTo: orView.centerXAnchor, constant: 0).isActive = true
        orLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        orLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true

        facebookLogoButton.translatesAutoresizingMaskIntoConstraints = false
        facebookLogoButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 18).isActive = true
        facebookLogoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        facebookLogoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -225).isActive = true
        facebookLogoButton.widthAnchor.constraint(equalToConstant: 43).isActive = true
        facebookLogoButton.heightAnchor.constraint(equalToConstant: 43).isActive = true

        googleLogoButton.translatesAutoresizingMaskIntoConstraints = false
        googleLogoButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 18).isActive = true
        googleLogoButton.trailingAnchor.constraint(equalTo: facebookLogoButton.leadingAnchor, constant: -20).isActive = true
        googleLogoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -225).isActive = true
        googleLogoButton.widthAnchor.constraint(equalToConstant: 43).isActive = true
        googleLogoButton.heightAnchor.constraint(equalToConstant: 43).isActive = true

        appleLogoButton.translatesAutoresizingMaskIntoConstraints = false
        appleLogoButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 18).isActive = true
        appleLogoButton.leadingAnchor.constraint(equalTo: facebookLogoButton.trailingAnchor, constant: 20).isActive = true
        appleLogoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -225).isActive = true
        appleLogoButton.widthAnchor.constraint(equalToConstant: 43).isActive = true
        appleLogoButton.heightAnchor.constraint(equalToConstant: 43).isActive = true

        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.topAnchor.constraint(equalTo: facebookLogoButton.bottomAnchor, constant: 31).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        signInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -142).isActive = true

        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 12).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 153).isActive = true

        signUpView.translatesAutoresizingMaskIntoConstraints = false
        signUpView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 0).isActive = true
        signUpView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        signUpView.centerXAnchor.constraint(equalTo: signUpButton.centerXAnchor, constant: 0).isActive = true
        signUpView.leadingAnchor.constraint(equalTo: signUpButton.leadingAnchor, constant: 1).isActive = true
        signUpView.trailingAnchor.constraint(equalTo: signUpButton.trailingAnchor, constant: -1).isActive = true
    }

    private func popUpWindowSetupConstrains() {
        popUpWindowView.translatesAutoresizingMaskIntoConstraints = false
        popUpWindowView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        popUpWindowView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -198).isActive = true
        popUpWindowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        popUpWindowView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true

        closePopUpWindowButton.translatesAutoresizingMaskIntoConstraints = false
        closePopUpWindowButton.topAnchor.constraint(equalTo: popUpWindowView.topAnchor, constant: 11).isActive = true
        closePopUpWindowButton.trailingAnchor.constraint(equalTo: popUpWindowView.trailingAnchor, constant: -11).isActive = true
        closePopUpWindowButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closePopUpWindowButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        logoPopUpWindowImage.translatesAutoresizingMaskIntoConstraints = false
        logoPopUpWindowImage.topAnchor.constraint(equalTo: popUpWindowView.topAnchor, constant: 60).isActive = true
        logoPopUpWindowImage.bottomAnchor.constraint(equalTo: popUpWindowView.bottomAnchor, constant: -212).isActive = true
        logoPopUpWindowImage.leadingAnchor.constraint(equalTo: popUpWindowView.leadingAnchor, constant: 34).isActive = true
        logoPopUpWindowImage.trailingAnchor.constraint(equalTo: popUpWindowView.trailingAnchor, constant: -34).isActive = true

        textPopUpWindow.translatesAutoresizingMaskIntoConstraints = false
        textPopUpWindow.topAnchor.constraint(equalTo: logoPopUpWindowImage.bottomAnchor, constant: 29).isActive = true
        textPopUpWindow.bottomAnchor.constraint(equalTo: popUpWindowView.bottomAnchor, constant: -78).isActive = true
        textPopUpWindow.leadingAnchor.constraint(equalTo: popUpWindowView.leadingAnchor, constant: 21).isActive = true
        textPopUpWindow.trailingAnchor.constraint(equalTo: popUpWindowView.trailingAnchor, constant: -21).isActive = true
    }

    private func setupTabBar() {
        title = "Профиль"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(questionPopUpWindow))
        navigationItem.leftBarButtonItem?.tintColor = .orange
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(closeWindowPopUp))
        navigationItem.rightBarButtonItem?.tintColor = .orange

        appearance.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.layer.cornerRadius = 20
    }

    private func setupUI() {
        view.backgroundColor = .white
        logoImage.image = UIImage(named: "Logo")

        loginLabel.text = "Логин"
        loginLabel.font = .montserrat(16, .medium)
        loginLabel.textColor = UIColor(red: 0.171, green: 0.166, blue: 0.192, alpha: 1)

        loginTextField.placeholder = " Введите логин "
        loginTextField.font = .montserrat(16, .regular)
        loginTextField.layer.cornerRadius = 8
        loginTextField.layer.borderWidth = 1
        loginTextField.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTextField.frame.height))
        loginTextField.leftViewMode = .always
        loginTextField.autocapitalizationType = .none

        passwordLabel.text = "Пароль"
        passwordLabel.font = .montserrat(16, .medium)
        passwordLabel.textColor = UIColor(red: 0.171, green: 0.166, blue: 0.192, alpha: 1)

        passwordTextField.placeholder = " Введите пароль "
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.layer.borderWidth = 1
        passwordTextField.font = .montserrat(16, .regular)
        passwordTextField.layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1).cgColor
        passwordTextField.isSecureTextEntry = true
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always

        securityButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        securityButton.tintColor = UIColor(red: 0.171, green: 0.166, blue: 0.192, alpha: 1)

        forgotYourPasswordButton.setTitle("Забыли пароль?", for: .normal)
        forgotYourPasswordButton.setTitleColor(UIColor(red: 0.171, green: 0.166, blue: 0.192, alpha: 1), for: .normal)
        forgotYourPasswordButton.titleLabel?.font = .montserrat(13, .medium)
        forgotYourPasswordButton.titleLabel?.textAlignment = .left

        forgotView.backgroundColor = .black
        forgotView.layer.opacity = 0.8

        orView.backgroundColor = .gray
        orView.layer.opacity = 0.8

        orLabel.text = "ИЛИ"
        orLabel.font = .montserrat(16, .regular)
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
        signInButton.titleLabel?.font = .montserrat(20, .semibold)
        signInButton.backgroundColor = UIColor(red: 0.929, green: 0.361, blue: 0.114, alpha: 1)
        signInButton.layer.cornerRadius = 10

        signUpButton.setTitle("Зарегистрироваться", for: .normal)
        signUpButton.titleLabel?.font = .montserrat(16, .medium)
        signUpButton.setTitleColor(UIColor(red: 0.929, green: 0.361, blue: 0.114, alpha: 1), for: .normal)

        signUpView.backgroundColor = UIColor(red: 0.929, green: 0.361, blue: 0.114, alpha: 1)

        securityButton.addTarget(self, action: #selector(securityEyeAction), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(registrationView), for: .touchUpInside)
        facebookLogoButton.addTarget(self, action: #selector(facebookRegistration), for: .touchUpInside)
    }

    private func setupPopUpWindow() {
        popUpWindowView.backgroundColor = .white
        popUpWindowView.layer.shadowColor = UIColor.gray.cgColor
        popUpWindowView.layer.shadowOpacity = 1.5
        popUpWindowView.layer.shadowOffset = .zero
        popUpWindowView.layer.shadowRadius = 200
        popUpWindowView.layer.cornerRadius = 16

        closePopUpWindowButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closePopUpWindowButton.tintColor = UIColor(red: 0.929, green: 0.361, blue: 0.114, alpha: 1)
        closePopUpWindowButton.backgroundColor = UIColor(red: 0.996, green: 0.954, blue: 0.921, alpha: 1)
        closePopUpWindowButton.layer.borderColor = UIColor(red: 1, green: 0.737, blue: 0.546, alpha: 1).cgColor
        closePopUpWindowButton.layer.borderWidth = 1
        closePopUpWindowButton.layer.cornerRadius = 4

        logoPopUpWindowImage.image = UIImage(named: "windowPopUp")
        popUpWindowSignInButton.setTitle("Войдите", for: .normal)
        popUpWindowSignUpButton.setTitle("зарегистрируйтесь", for: .normal)

        textPopUpWindow.text = """
        \(popUpWindowSignInButton)  или зарегистрируйтесь , чтобы добавить в приложение информацию о домашнем питомце.
        Вы также сможете внести информацию о себе.
        """
        // \(popUpWindowSignInButton) \(popUpWindowSignUpButton)

        textPopUpWindow.isEditable = false
        textPopUpWindow.isSelectable = false
        textPopUpWindow.font = .montserrat(16, .medium)

        signInButton.addTarget(self, action: #selector(signInProfile), for: .touchUpInside)

        closePopUpWindowButton.addTarget(self, action: #selector(closeWindowPopUp), for: .touchUpInside)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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

    @objc func registrationView() {
        let vc = RegistrationViewController()

        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func signInProfile() {
        let login = loginTextField.text!
        let password = passwordTextField.text!
        signInWithEmail(email: login, password: password) { verified, status in
            if !verified {
                let alert = UIAlertController(title: "Ошибка",
                                              message: status,
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                self.present(alert, animated: true,
                             completion: nil)

            } else {
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default
                    .post(name: NSNotification.Name("statusChange"), object: nil)
                let vc = MedicineViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

    @objc func closeWindowPopUp() {
        popUpWindowView.isHidden = true
    }

    @objc func questionPopUpWindow() {
        popUpWindowView.isHidden = false
    }

    @objc func facebookRegistration() {

        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile"], from: self) { result, error in
            if let error = error {
                print("Encountered Erorr: \(error)")
            } else if let result = result, result.isCancelled {
                print("Cancelled")
            } else {
                print("Logged In")
                UserDefaults.standard.set(true, forKey: "status")
                let vc = MedicineViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
