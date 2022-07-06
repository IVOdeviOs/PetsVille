import UIKit

final class OwnerInformationViewController: UIViewController {

    // MARK: - Properties
    // MARK: Public
    var areas = [String]()
    lazy var screenWidth = UIScreen.main.bounds.width

    // MARK: Private
    private let appearance = UINavigationBarAppearance()
    private var backButton = UIBarButtonItem()
    private let ownerImage = UIImageView()
    private let imageLabel = UILabel()
    private let nameTextField = UITextField()
    private let bDayTextField = UITextField()
    private let phoneTextField = UITextField()
    private let areaTextField = UITextField()
    private let aboutMeLabel = UILabel()
    private let aboutMeTextView = UITextView()
    private let areaPicker = UIPickerView()
    private var selectedArea = "Фрунзенский"
    private var ownerModel = [Owner]()
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstrains()
        setupUI()
        setupNavigationBar()
        setupTextField()
        setupPickerView()
        tapImageView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ownerImage.layer.cornerRadius = 8
        ownerImage.layer.masksToBounds = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let users = CoreDataManager.instance.getPerson() else { return }
        ownerModel = users
        ownerSettings()
    }

    // MARK: - API

    // MARK: - Setups
    private func addSubviews() {
        view.addAllSubviews(ownerImage,
                            imageLabel,
                            nameTextField,
                            bDayTextField,
                            phoneTextField,
                            areaTextField,
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

        areaTextField.translatesAutoresizingMaskIntoConstraints = false
        areaTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 30).isActive = true
        areaTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        areaTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        areaTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.topAnchor.constraint(equalTo: areaTextField.bottomAnchor, constant: 30).isActive = true
        aboutMeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        aboutMeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        aboutMeLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true

        aboutMeTextView.translatesAutoresizingMaskIntoConstraints = false
        aboutMeTextView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 5).isActive = true
        aboutMeTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        aboutMeTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        aboutMeTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -88).isActive = true
    }

    private func setupTextField() {
        phoneTextField.keyboardType = .phonePad
        nameTextField.underlined(text: "Имя", isHidden: true)
        bDayTextField.underlined(text: "Дата рождения", isHidden: false)
        phoneTextField.underlined(text: "Телефон", isHidden: true)
        areaTextField.underlined(text: "Район", isHidden: false)
        bDayTextField.setInputDatePicker(target: self, selector: #selector(saveBDay))

        aboutMeLabel.text = "О себе"
        aboutMeLabel.textColor = UIColor(red: 0.569, green: 0.569, blue: 0.569, alpha: 1)

        aboutMeTextView.font = .montserrat(18, .regular)
        aboutMeTextView.textColor = UIColor(red: 0.171, green: 0.166, blue: 0.192, alpha: 1)
    }

    private func ownerSettings() {
        nameTextField.text = ownerModel.first?.name

        phoneTextField.text = ownerModel.first?.phoneNumber ?? "+375"

        let dateAnswer = DateFormatter()
        dateAnswer.dateFormat = "dd MMM yyyy"
        let releasingDate: String = dateAnswer.string(from: ownerModel.first?.bDay ?? Date(timeIntervalSince1970: .leastNonzeroMagnitude))

        bDayTextField.text = releasingDate
        ownerImage.image = UIImage(data: (ownerModel.first?.photo ?? UIImage(named: "Hello")?.pngData())!)

        areaTextField.text = ownerModel.first?.area
        aboutMeTextView.text = ownerModel.first?.aboutMe
    }

    private func setupPickerView() {
        areas = ["Фрунзенский", "Московский", "Партизанский", "Октябрьский", "Советский", "Первомайский", "Ленинский", "Центральный", "Заводской"]
        areaPicker.frame = CGRect(x: 0,
                                  y: 0,
                                  width: screenWidth,
                                  height: 220)

        areaPicker.delegate = self
        areaPicker.dataSource = self

        areaTextField.inputView = areaPicker
        let toolBar = UIToolbar(frame: CGRect(x: 0,
                                              y: 0,
                                              width: screenWidth,
                                              height: 44))
        let spacing = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                      target: nil,
                                      action: nil)
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel,
                                     target: nil,
                                     action: #selector(cancelInputView))

        let done = UIBarButtonItem(barButtonSystemItem: .done,
                                   target: target,
                                   action: #selector(saveAreaCountry))

        toolBar.backgroundColor = .white
        toolBar.setItems([cancel, spacing, done], animated: false)
        areaTextField.inputAccessoryView = toolBar
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

        appearance.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.layer.cornerRadius = 20
        tabBarController?.tabBar.isHidden = true

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save", style: .plain, target: self, action: #selector(backNavButton))

        backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(backNavButton))
    }

    private func tapImageView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(imagePickerBtnAction))
        ownerImage.isUserInteractionEnabled = true
        ownerImage.addGestureRecognizer(tap)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // MARK: - Helpers

    @objc private func backNavButton() {
        guard let datePickers = bDayTextField.inputView as? UIDatePicker else {
            let dateAnswer = DateFormatter()
            dateAnswer.dateFormat = "dd MMM yyyy"
            return
        }

        let name = nameTextField.text ?? "Имя"
        let bDay = datePickers.date
        let phoneNumber = phoneTextField.text ?? "+375291234567"
        let area = selectedArea
        let aboutMe = aboutMeTextView.text ?? ""

        let person = Owner(photo: (ownerImage.image?.pngData())!,
                           name: name,
                           bDay: bDay,
                           phoneNumber: phoneNumber,
                           area: area,
                           aboutMe: aboutMe)
        CoreDataManager.instance.savePerson(person)

        navigationController?.popViewController(animated: true)
    }

    @objc func saveBDay() {
        if let datePickers = bDayTextField.inputView as? UIDatePicker {

            let dateAnswer = DateFormatter()
            dateAnswer.dateFormat = "dd MMM yyyy"
            let releasingDate: String = dateAnswer.string(from: datePickers.date)

            bDayTextField.text = releasingDate
        }

        bDayTextField.endEditing(true)
    }

    @objc func saveAreaCountry() {
        areaTextField.text = selectedArea
        areaTextField.endEditing(true)
    }

    @objc func cancelInputView() {
        resignFirstResponder()
    }

    @objc private func imagePickerBtnAction() {
        let alert = UIAlertController(title: "Выбрать изображение", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Камера", style: .default, handler: { _ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Галерея", style: .default, handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension OwnerInformationViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    private func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    private func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Warning",
                                          message: "You don't have permission to access gallery.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any])
    {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.originalImage] as? UIImage {
            ownerImage.image = image
        }
        if let image = info[.editedImage] as? UIImage {
            ownerImage.image = image
        }
    }
}

extension OwnerInformationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        areas.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        areas[row]
    }

    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        selectedArea = areas[row]
        print(selectedArea)
    }
}
