import UIKit

final class MedicineTableViewCell: UITableViewCell {
    
    // MARK: Private
    // MARK: - Properties
    static let identifier = "MedicineTableViewCell"
    private var rating: Double = 0
    
    // MARK: Private
    // MARK: - Outlets
    private let mainView = UIView()
    
    private let clinicTitleLabel = UILabel()
    private let clinicAdressLabel = UILabel()
    private let workTimeLabel = UILabel()
    private let ratingLabel = UILabel()
    private let numberOfRatingLabel = UILabel()
    
    private let clinicInfoStackView = UIStackView()
    private let ratingStackView = UIStackView()
    private let ratingAndTimeStackView = UIStackView()
    private let mainClinicInfoStackView = UIStackView()
    
    private let firstClinicPhotoImageView = UIImageView()
    private let secondClinicPhotoImageView = UIImageView()
    private let thirdClinicPhotoImageView = UIImageView()
    private let photoStackView = UIStackView()
    
    private let reviewLabel = UILabel()
    private let allReviewsButton = UIButton()
    private let reviewStackView = UIStackView()
    
    private let callButton = UIButton()
    private let enrollButton = UIButton()
    
    // MARK: Private
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
        setupUI()
        setupNavigationBar()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private
    // MARK: - Setups
    private func addSubviews() {
        contentView.addSubview(mainView)
        mainView.addAllSubviews(mainClinicInfoStackView,
                                photoStackView,
                                reviewStackView,
                                callButton,
                                enrollButton)
        mainClinicInfoStackView.addAllArrangedSubviews(clinicInfoStackView,
                                                       ratingAndTimeStackView)
        clinicInfoStackView.addAllArrangedSubviews(clinicTitleLabel,
                                                   clinicAdressLabel)
        ratingStackView.addAllArrangedSubviews(numberOfRatingLabel,
                                               ratingLabel)
        ratingAndTimeStackView.addAllArrangedSubviews(ratingStackView,
                                                      workTimeLabel)
        photoStackView.addAllArrangedSubviews(firstClinicPhotoImageView,
                                              secondClinicPhotoImageView,
                                              thirdClinicPhotoImageView)
        reviewStackView.addAllArrangedSubviews(reviewLabel,
                                               allReviewsButton)
    }
    
    private func setupNavigationBar() {
    }
    
    private func addConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        mainClinicInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        mainClinicInfoStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true
        mainClinicInfoStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20).isActive = true
        mainClinicInfoStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        mainClinicInfoStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        photoStackView.translatesAutoresizingMaskIntoConstraints = false
        photoStackView.topAnchor.constraint(equalTo: mainClinicInfoStackView.bottomAnchor, constant: 10).isActive = true
        photoStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20).isActive = true
        photoStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        photoStackView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        reviewStackView.translatesAutoresizingMaskIntoConstraints = false
        reviewStackView.topAnchor.constraint(equalTo: photoStackView.bottomAnchor, constant: 20).isActive = true
        reviewStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20).isActive = true
        reviewStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        reviewStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        callButton.translatesAutoresizingMaskIntoConstraints = false
        callButton.topAnchor.constraint(equalTo: reviewStackView.bottomAnchor, constant: 10).isActive = true
        callButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        callButton.widthAnchor.constraint(equalTo: callButton.heightAnchor).isActive = true
        callButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20).isActive = true
        
        enrollButton.translatesAutoresizingMaskIntoConstraints = false
        enrollButton.topAnchor.constraint(equalTo: reviewStackView.bottomAnchor, constant: 10).isActive = true
        enrollButton.heightAnchor.constraint(equalTo: callButton.heightAnchor).isActive = true
        enrollButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        enrollButton.leadingAnchor.constraint(equalTo: callButton.trailingAnchor, constant: 15).isActive = true
    }
    
    private func setupUI() {
        mainView.backgroundColor = .white
        setupClinicInfoUI()
        setupUIPhotoStackView()
        setupAllReviewsStackView()
        setupUIButtons()
    }
    
    private func setupClinicInfoUI() {
        clinicInfoStackView.distribution = .fillProportionally
        ratingAndTimeStackView.distribution = .fillProportionally
        
        mainClinicInfoStackView.axis = .horizontal
        clinicInfoStackView.axis = .vertical
        ratingAndTimeStackView.axis = .vertical
        ratingStackView.axis = .horizontal
        
        clinicTitleLabel.font = .montserrat(20, .semibold)
        clinicAdressLabel.font = .montserrat(12, .regular)
        workTimeLabel.font = .montserrat(12, .regular)
        numberOfRatingLabel.font = .montserrat(12, .semibold)
        
        ratingStackView.spacing = 5
        
        workTimeLabel.textAlignment = .right
        workTimeLabel.textColor = .gray
        numberOfRatingLabel.textColor = .gray
        
        workTimeLabel.text = "20:00"
    }
    
    private func setupUIPhotoStackView() {
        firstClinicPhotoImageView.addCornerRadius(10)
        secondClinicPhotoImageView.addCornerRadius(10)
        thirdClinicPhotoImageView.addCornerRadius(10)
        
        photoStackView.axis = .horizontal
        photoStackView.distribution = .fillEqually
        photoStackView.spacing = 10
    }
    
    private func setupAllReviewsStackView() {
        reviewStackView.axis = .vertical
        
        allReviewsButton.titleLabel?.textAlignment = .center
        allReviewsButton.setTitle("Все отзывы", for: .normal)
        allReviewsButton.backgroundColor = .white
        allReviewsButton.setTitleColor(.red, for: .normal)
        allReviewsButton.titleLabel?.font = .montserrat(12, .medium)
        
        reviewLabel.layer.borderWidth = 2
        reviewLabel.layer.cornerRadius = 10
        reviewLabel.layer.borderColor = AppColor.grayColor.cgColor
        
        reviewLabel.text = "  Отзыв: Приём прошёл классно"
        reviewLabel.font = .montserrat(12, .regular)
    }
    
    private func setupUIButtons() {
        //        callButton.layer.cornerRadius = callButton.frame.width/2
        callButton.layer.cornerRadius = 25
        callButton.backgroundColor = .red
        callButton.setImage(UIImage(systemName: "phone.fill"), for: .normal)
        
        enrollButton.setTitle("Записаться", for: .normal)
        enrollButton.titleLabel?.textColor = .white
        enrollButton.backgroundColor = .red
        enrollButton.titleLabel?.font = .montserrat(16, .medium)
        enrollButton.layer.cornerRadius = 15
    }
    
    // MARK: Public
    // MARK: - API
    func setInfo (_ params: Object) {
        rating = params.rating
        numberOfRatingLabel.text = "\(params.rating)"
        ratingLabel.attributedText = objectRating(rating)
        clinicTitleLabel.text = params.name
        clinicAdressLabel.text = params.address
        firstClinicPhotoImageView.image = params.arrayOfPhoto[0].image
        secondClinicPhotoImageView.image = params.arrayOfPhoto[1].image
        thirdClinicPhotoImageView.image = params.arrayOfPhoto[2].image
    }
    
    // MARK: Private
    // MARK: - Helpers
    private func objectRating(_ rating: Double) -> NSAttributedString {
        let firstAttributes = [NSAttributedString.Key.foregroundColor: UIColor(
            red: 255/255,
            green: 155/255,
            blue: 82/255,
            alpha: 1
        ), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        let secondAttributes = [NSAttributedString.Key.foregroundColor: UIColor(
            red: 196/255,
            green: 196/255,
            blue: 196/255,
            alpha: 1
        ), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        let firstString = NSAttributedString(string: "\u{2605}", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "\u{2605}", attributes: secondAttributes)
        let returnedString = NSMutableAttributedString()
        switch rating {
        case 0...1.9:
            returnedString.append(firstString)
            returnedString.append(secondString)
            returnedString.append(secondString)
            returnedString.append(secondString)
            returnedString.append(secondString)
            return returnedString
        case 2...2.9:
            returnedString.append(firstString)
            returnedString.append(firstString)
            returnedString.append(secondString)
            returnedString.append(secondString)
            returnedString.append(secondString)
            return returnedString
        case 3...3.9:
            returnedString.append(firstString)
            returnedString.append(firstString)
            returnedString.append(firstString)
            returnedString.append(secondString)
            returnedString.append(secondString)
            return returnedString
        case 4...4.9:
            returnedString.append(firstString)
            returnedString.append(firstString)
            returnedString.append(firstString)
            returnedString.append(firstString)
            returnedString.append(secondString)
            return returnedString
        case 5:
            returnedString.append(firstString)
            returnedString.append(firstString)
            returnedString.append(firstString)
            returnedString.append(firstString)
            returnedString.append(firstString)
            return returnedString
        default:
            return returnedString
        }
    }
    
    // MARK: Private
    // MARK: - Actions
}
