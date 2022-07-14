import UIKit

final class MedicineTableViewCell: UITableViewCell {
    
    static let identifier = "MedicineTableViewCell"
    
    private let mainView = UIView()
    
    private let clinicTitleLabel = UILabel()
    private let clinicAdressLabel = UILabel()
    private let workTimeLabel = UILabel()
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
    private let redButtonsStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(mainView)
        mainView.addAllSubviews(mainClinicInfoStackView,
                                photoStackView,
                                reviewStackView)
        mainClinicInfoStackView.addAllArrangedSubviews(clinicTitleLabel,
                                               clinicAdressLabel,
                                               workTimeLabel)
        photoStackView.addAllArrangedSubviews(firstClinicPhotoImageView,
                                              secondClinicPhotoImageView,
                                              thirdClinicPhotoImageView)
        reviewStackView.addAllArrangedSubviews(reviewLabel,
                                               allReviewsButton)
        
        redButtonsStackView.addAllArrangedSubviews(callButton,
                                                   enrollButton)
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
        
        photoStackView.translatesAutoresizingMaskIntoConstraints = false
        photoStackView.topAnchor.constraint(equalTo: mainClinicInfoStackView.bottomAnchor, constant: -10).isActive = true
        photoStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20).isActive = true
        photoStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        
        reviewStackView.translatesAutoresizingMaskIntoConstraints = false
        reviewStackView.topAnchor.constraint(equalTo: photoStackView.bottomAnchor, constant: 20).isActive = true
        reviewStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20).isActive = true
        reviewStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
    }
    
    private func setupUI() {
        mainView.backgroundColor = .white
        setupClinicInfoUI()
        reviewLabel.text = "Отзыв: Приём прошёл классно"
        workTimeLabel.text = "20:00"
    }
    
    private func setupClinicInfoUI() {
        clinicTitleLabel.font = .montserrat(20, .semibold)
        clinicAdressLabel.font = .montserrat(12, .regular)
        workTimeLabel.font = .montserrat(12, .regular)
        workTimeLabel.textColor = .gray
    }
    
    private func setupInfoStackView(_ params: Object) {
        clinicTitleLabel.text = params.name
        clinicAdressLabel.text = params.address
        firstClinicPhotoImageView.image = params.arrayOfPhoto[0].image
        secondClinicPhotoImageView.image = params.arrayOfPhoto[1].image
        thirdClinicPhotoImageView.image = params.arrayOfPhoto[2].image
        
    }
}
