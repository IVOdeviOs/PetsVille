import UIKit

final class PetsTableViewCell: UITableViewCell {

    // MARK: - Properties
    // MARK: Public
    static let reuseIdentifier = "PetsTableViewCell"

    // MARK: Private
    private let viewPets = UIView()
    private var stackView = UIStackView()
    private let nameLabel = UILabel()
    private let countryLabel = UILabel()
    private let ageLabel = UILabel()
    private let imagePerson = UIImageView()
    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStackView()
        addSubviews()
        setupConstrains()
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - API
    
    // MARK: - Setups
    private func addSubviews() {
        contentView.addSubview(viewPets)
        viewPets.addAllSubviews(stackView,imagePerson)
    }
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [nameLabel, countryLabel, ageLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
    }
    private func setupConstrains() {
        viewPets.translatesAutoresizingMaskIntoConstraints = false
        viewPets.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7).isActive = true
        viewPets.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7).isActive = true
        viewPets.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25).isActive = true
        viewPets.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25).isActive = true

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: viewPets.topAnchor, constant: 39).isActive = true
        stackView.bottomAnchor.constraint(equalTo: viewPets.bottomAnchor, constant: -58).isActive = true
        stackView.leadingAnchor.constraint(equalTo: viewPets.leadingAnchor, constant: 41).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        imagePerson.translatesAutoresizingMaskIntoConstraints = false
        imagePerson.topAnchor.constraint(equalTo: viewPets.topAnchor, constant: 13).isActive = true
        imagePerson.bottomAnchor.constraint(equalTo: viewPets.bottomAnchor, constant: -12).isActive = true
        imagePerson.trailingAnchor.constraint(equalTo: viewPets.trailingAnchor, constant: -26).isActive = true
        imagePerson.widthAnchor.constraint(equalToConstant: 144).isActive = true
        
    }
    
    private func setupUI(){
        viewPets.backgroundColor = .white
        viewPets.layer.borderColor = UIColor(red: 0.569, green: 0.569, blue: 0.569, alpha: 1).cgColor
        viewPets.layer.borderWidth = 1
        nameLabel.text = "Имя"
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textColor = .black
        countryLabel.text = "Город"
        ageLabel.text = "Возраст"
        imagePerson.image = UIImage(named: "Hello")
        viewPets.layer.cornerRadius = 8

    }
    // MARK: - Helpers
    
}
