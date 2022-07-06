import UIKit

final class PetsTableViewCell: UITableViewCell {

    // MARK: - Properties
    // MARK: Public
    static let reuseIdentifier = "PetsTableViewCell"

    // MARK: Private
    private let view = UIView()
    private var stackView = UIStackView()
    private let nameLabel = UILabel()
    private let viewPets = UILabel()
    private let ageLabel = UILabel()
    private let imagePets = UIImageView()

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
    func set(pets: Pets) {
        imagePets.image = UIImage(data: pets.petsPhoto)
        nameLabel.text = pets.nickName
        viewPets.text = pets.viewPets
        let brDay = Calendar.current.dateComponents([.year, .month, .day], from: pets.bDayPets )

        let today = Calendar.current.dateComponents([.year, .month, .day], from: .now )

        let age = Int16(today.year! - brDay.year!)
        
        ageLabel.text = "\(age ) лет"
    }
    // MARK: - Setups
    private func addSubviews() {
        contentView.addSubview(view)
        view.addAllSubviews(stackView,imagePets)
    }
   
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [nameLabel, viewPets, ageLabel])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
    }
    private func setupConstrains() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25).isActive = true

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 39).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -58).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 41).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        imagePets.translatesAutoresizingMaskIntoConstraints = false
        imagePets.topAnchor.constraint(equalTo: view.topAnchor, constant: 13).isActive = true
        imagePets.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12).isActive = true
        imagePets.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26).isActive = true
        imagePets.widthAnchor.constraint(equalToConstant: 144).isActive = true
        imagePets.heightAnchor.constraint(equalToConstant: 144).isActive = true
        
    }
    
    private func setupUI(){
        view.backgroundColor = .white
        view.layer.borderColor = UIColor(red: 0.569, green: 0.569, blue: 0.569, alpha: 1).cgColor
        view.layer.borderWidth = 1
        nameLabel.text = "Имя"
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.textColor = .black
        viewPets.text = "Город"
        ageLabel.text = "Возраст"
        imagePets.image = UIImage(named: "Hello")
        imagePets.layer.cornerRadius = 8
        imagePets.layer.masksToBounds = true

        view.layer.cornerRadius = 8

    }
    // MARK: - Helpers
    
}
