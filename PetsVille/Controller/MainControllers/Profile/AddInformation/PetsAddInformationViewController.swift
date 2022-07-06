import UIKit

final class PetsAddInformationViewController: UIViewController {

    // MARK: - Properties
    // MARK: Public
    lazy var screenWidth = UIScreen.main.bounds.width
    // MARK: Private
    private let appearance = UINavigationBarAppearance()
    private var backButton = UIBarButtonItem()

    private let petsImage = UIImageView()
    private let petsLabel = UILabel()
    private let nickNameTextField = UITextField()
    private let viewPetsTextField = UITextField()
    private let genderTextField = UITextField()
    private let breedTextField = UITextField()
    private let colorTextField = UITextField()
    private let weightTextField = UITextField()
    private let bDayTextField = UITextField()
    private let genderPickerView = UIPickerView()
    private var gender = [String]()
    private var selectedGender = "Девочка"
    private let weightPickerView = UIPickerView()
    private let weightOfPicker = Array(stride(from: 0.0, through: 80.0, by: 0.2))
    private var weight = [String]()
    private var selectedWeight = "15.0"
    private var petsModel = [Pets]()
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstrains()
        setupUI()
        setupNavigationBar()
        setupTextField()
        setupGenderPickerView()
        setupWeightPickerView()
        tapImageView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        petsImage.layer.cornerRadius = 8
        petsImage.layer.masksToBounds = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let pets = CoreDataManager.instance.getPets() else { return }
        petsModel = pets
        ownerSettings()
    }

    // MARK: - API

    // MARK: - Setups
    private func addSubviews() {
        view.addAllSubviews(petsImage,
                            petsLabel,
                            nickNameTextField,
                            bDayTextField,
                            viewPetsTextField,
                            genderTextField,
                            breedTextField,
                            colorTextField,
                            weightTextField)
    }

    private func setupConstrains() {
        petsImage.translatesAutoresizingMaskIntoConstraints = false
        petsImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 118).isActive = true
        petsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        petsImage.widthAnchor.constraint(equalToConstant: 156).isActive = true
        petsImage.heightAnchor.constraint(equalToConstant: 156).isActive = true

        petsLabel.translatesAutoresizingMaskIntoConstraints = false
        petsLabel.topAnchor.constraint(equalTo: petsImage.bottomAnchor, constant: 0).isActive = true
        petsLabel.centerXAnchor.constraint(equalTo: petsImage.centerXAnchor, constant: 0).isActive = true
        petsLabel.widthAnchor.constraint(equalToConstant: 271).isActive = true
        petsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        nickNameTextField.translatesAutoresizingMaskIntoConstraints = false
        nickNameTextField.topAnchor.constraint(equalTo: petsLabel.bottomAnchor, constant: 45).isActive = true
        nickNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        nickNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        nickNameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        viewPetsTextField.translatesAutoresizingMaskIntoConstraints = false
        viewPetsTextField.topAnchor.constraint(equalTo: nickNameTextField.bottomAnchor, constant: 30).isActive = true
        viewPetsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        viewPetsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        viewPetsTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        genderTextField.translatesAutoresizingMaskIntoConstraints = false
        genderTextField.topAnchor.constraint(equalTo: viewPetsTextField.bottomAnchor, constant: 30).isActive = true
        genderTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        genderTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        genderTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        breedTextField.translatesAutoresizingMaskIntoConstraints = false
        breedTextField.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 30).isActive = true
        breedTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        breedTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        breedTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        colorTextField.translatesAutoresizingMaskIntoConstraints = false
        colorTextField.topAnchor.constraint(equalTo: breedTextField.bottomAnchor, constant: 30).isActive = true
        colorTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        colorTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        colorTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        weightTextField.topAnchor.constraint(equalTo: colorTextField.bottomAnchor, constant: 30).isActive = true
        weightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        weightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        weightTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        bDayTextField.translatesAutoresizingMaskIntoConstraints = false
        bDayTextField.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 30).isActive = true
        bDayTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        bDayTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        bDayTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func setupTextField() {
        nickNameTextField.underlined(text: "Кличка", isHidden: true)
        viewPetsTextField.underlined(text: "Вид", isHidden: true)
        genderTextField.underlined(text: "Пол", isHidden: false)
        breedTextField.underlined(text: "Порода", isHidden: true)
        colorTextField.underlined(text: "Окрас", isHidden: true)
        weightTextField.underlined(text: "Вес", isHidden: false)
        bDayTextField.underlined(text: "Дата рождения", isHidden: false)

        bDayTextField.setInputDatePicker(target: self, selector: #selector(saveBDay))
    }

    private func ownerSettings() {

        let dateAnswer = DateFormatter()
        dateAnswer.dateFormat = "dd MMM yyyy"
        let releasingDate: String = dateAnswer.string(from: petsModel.first?.bDayPets ?? Date(timeIntervalSince1970: .leastNonzeroMagnitude))

//        nickNameTextField.text = petsModel.first?.nickName
//        viewPetsTextField.text = petsModel.first?.viewPets
//        genderTextField.text = petsModel.first?.gender
//        breedTextField.text = petsModel.first?.breed
//        colorTextField.text = petsModel.first?.colorPets
//        weightTextField.text = petsModel.first?.weightPets
//
        bDayTextField.text = releasingDate
//        petsImage.image = UIImage(data: (petsModel.first?.petsPhoto ?? UIImage(named: "Animal")?.pngData())!)
    }

    private func setupGenderPickerView() {
        gender = ["Девочка", "Мальчик"]
        genderPickerView.frame = CGRect(x: 0,
                                        y: 0,
                                        width: screenWidth,
                                        height: 220)

        genderPickerView.delegate = self
        genderPickerView.dataSource = self

        genderTextField.inputView = genderPickerView
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
                                   action: #selector(saveGenderPets))

        toolBar.backgroundColor = .white
        toolBar.setItems([cancel, spacing, done], animated: false)
        genderTextField.inputAccessoryView = toolBar
    }

    private func setupWeightPickerView() {
        weightPickerView.frame = CGRect(x: 0,
                                        y: 0,
                                        width: screenWidth,
                                        height: 220)

        weightPickerView.delegate = self
        weightPickerView.dataSource = self

        weightTextField.inputView = weightPickerView

        let toolBar = UIToolbar(frame: CGRect(x: 0,
                                              y: 0,
                                              width: screenWidth,
                                              height: 44))
        let spacing = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                      target: nil,
                                      action: nil)
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel,
                                     target: nil,
                                     action: #selector(cancelInputViewWeight))

        let done = UIBarButtonItem(barButtonSystemItem: .done,
                                   target: target,
                                   action: #selector(saveWeightPets))

        toolBar.backgroundColor = .white
        toolBar.setItems([cancel, spacing, done], animated: false)
        weightTextField.inputAccessoryView = toolBar
    }

    private func setupUI() {
        view.backgroundColor = .white

        petsImage.image = UIImage(named: "Animal")
        petsImage.layer.borderColor = UIColor(red: 0.569, green: 0.569, blue: 0.569, alpha: 1).cgColor
        petsImage.layer.borderWidth = 1
        petsImage.layer.cornerRadius = 8

        petsLabel.text = "Выбрать изображение питомца"
        petsLabel.textColor = UIColor(red: 0.171, green: 0.166, blue: 0.192, alpha: 1)
        petsLabel.font = .systemFont(ofSize: 16)
        petsLabel.textAlignment = .center
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
        petsImage.isUserInteractionEnabled = true
        petsImage.addGestureRecognizer(tap)
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

        let nickName = nickNameTextField.text ?? ""
        let bDay = datePickers.date
        let viewPets = viewPetsTextField.text ?? ""
        let gender = selectedGender
        let breed = breedTextField.text ?? ""
        let colorPets = colorTextField.text ?? ""
        let weightPets = selectedWeight

        let pets = Pets(petsPhoto: (petsImage.image?.pngData())!,
                        nickName: nickName,
                        viewPets: viewPets,
                        gender: gender,
                        breed: breed,
                        colorPets: colorPets,
                        weightPets: weightPets,
                        bDayPets: bDay)
        CoreDataManager.instance.savePets(pets)

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

    @objc func saveGenderPets() {
        genderTextField.text = selectedGender
        genderTextField.endEditing(true)
    }

    @objc func saveWeightPets() {
        weightTextField.text = selectedWeight
        weightTextField.endEditing(true)
    }

    @objc func cancelInputView() {
        genderTextField.endEditing(true)
    }

    @objc func cancelInputViewWeight() {
        weightTextField.endEditing(true)
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

extension PetsAddInformationViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
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
            petsImage.image = image
        }
        if let image = info[.editedImage] as? UIImage {
            petsImage.image = image
        }
    }
}

extension PetsAddInformationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        if pickerView == genderPickerView {
            return gender.count
        } else if pickerView == weightPickerView {
            return weightOfPicker.count
        }
        return 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if pickerView == genderPickerView {
            return gender[row]
        } else if pickerView == weightPickerView {
            for string in weightOfPicker {
                weight.append(String(format: "%.1f", string))
            }
            return "\(weight[row]) кг "
        }
        return nil
    }

    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        if pickerView == genderPickerView {
            selectedGender = gender[row]
        } else if pickerView == weightPickerView {
            selectedWeight = "\(weight[row]) кг "
        }
    }
}
