
import UIKit

final class ListTableViewCell: UITableViewCell {
    
    // MARK: Private
    
    private let objectName = UILabel()
    private let objectAddress = UILabel()
    private var star1 = UIImageView()
    private var star2 = UIImageView()
    private var star3 = UIImageView()
    private var star4 = UIImageView()
    private var star5 = UIImageView()
    private let objectImage = UIImageView()
   
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - API
    func set(object: Object) {
        objectImage.image = object.arrayOfPhoto[0].image
        objectName.text = object.name
        objectAddress.text = object.address
        let star = UIImage(named: "star")
        let starFill = UIImage(named: "star.fill")
        starFill?.withTintColor(UIColor(red: 255/255, green: 188/255, blue: 139/255, alpha: 1))
        switch object.rating {
        case 0...1:
            star1.image = starFill
            star2.image = star
            star3.image = star
            star4.image = star
            star5.image = star
        case 1.1...2:
            star1.image = starFill
            star2.image = starFill
            star3.image = star
            star4.image = star
            star5.image = star
        case 2.1...3:
            star1.image = starFill
            star2.image = starFill
            star3.image = starFill
            star4.image = star
            star5.image = star
        case 3.1...4:
            star1.image = starFill
            star2.image = starFill
            star3.image = starFill
            star4.image = starFill
            star5.image = star
        case 4.1...5:
            star1.image = starFill
            star2.image = starFill
            star3.image = starFill
            star4.image = starFill
            star5.image = starFill
        default:
            break
        }
    }

    // MARK: - Setups
    private func addSubviews() {
        contentView.addSubview(objectName)
        contentView.addSubview(objectAddress)
        contentView.addSubview(star1)
        contentView.addSubview(star2)
        contentView.addSubview(star3)
        contentView.addSubview(star4)
        contentView.addSubview(star5)
        contentView.addSubview(objectImage)
    }

    private func setupConstraints() {
        objectName.translatesAutoresizingMaskIntoConstraints = false
        objectName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        objectName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        objectName.widthAnchor.constraint(equalToConstant: 68).isActive = true
        objectName.heightAnchor.constraint(equalToConstant: 21).isActive = true

        objectAddress.translatesAutoresizingMaskIntoConstraints = false
        objectAddress.topAnchor.constraint(equalTo: objectName.bottomAnchor, constant: 1).isActive = true
        objectAddress.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        objectAddress.widthAnchor.constraint(equalToConstant: 144).isActive = true
        objectAddress.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        objectImage.translatesAutoresizingMaskIntoConstraints = false
        objectImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11).isActive = true
        objectImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        objectImage.widthAnchor.constraint(equalToConstant: 49).isActive = true
        objectImage.heightAnchor.constraint(equalToConstant: 49).isActive = true
        
        star1.translatesAutoresizingMaskIntoConstraints = false
        star1.topAnchor.constraint(equalTo: objectAddress.bottomAnchor, constant: 8).isActive = true
        star1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        star1.widthAnchor.constraint(equalToConstant: 12).isActive = true
        star1.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        star2.translatesAutoresizingMaskIntoConstraints = false
        star2.topAnchor.constraint(equalTo: objectAddress.bottomAnchor, constant: 8).isActive = true
        star2.leadingAnchor.constraint(equalTo: star1.trailingAnchor, constant: 1).isActive = true
        star2.widthAnchor.constraint(equalToConstant: 12).isActive = true
        star2.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        star3.translatesAutoresizingMaskIntoConstraints = false
        star3.topAnchor.constraint(equalTo: objectAddress.bottomAnchor, constant: 8).isActive = true
        star3.leadingAnchor.constraint(equalTo: star2.trailingAnchor, constant: 1).isActive = true
        star3.widthAnchor.constraint(equalToConstant: 12).isActive = true
        star3.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        star4.translatesAutoresizingMaskIntoConstraints = false
        star4.topAnchor.constraint(equalTo: objectAddress.bottomAnchor, constant: 8).isActive = true
        star4.leadingAnchor.constraint(equalTo: star3.trailingAnchor, constant: 1).isActive = true
        star4.widthAnchor.constraint(equalToConstant: 12).isActive = true
        star4.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        star5.translatesAutoresizingMaskIntoConstraints = false
        star5.topAnchor.constraint(equalTo: objectAddress.bottomAnchor, constant: 8).isActive = true
        star5.leadingAnchor.constraint(equalTo: star4.trailingAnchor, constant: 1).isActive = true
        star5.widthAnchor.constraint(equalToConstant: 12).isActive = true
        star5.heightAnchor.constraint(equalToConstant: 12).isActive = true

    }

    private func setupUI() {
        contentView.backgroundColor = .white

        objectImage.contentMode = .scaleToFill
        
        objectName.textAlignment = .left
        objectName.textColor = .black
        
        objectAddress.textAlignment = .left
        objectAddress.textColor = .black
    }
}
