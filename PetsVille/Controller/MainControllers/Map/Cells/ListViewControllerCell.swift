
import UIKit

final class ListTableViewCell: UITableViewCell {
    
    // MARK: Private
    
     let backgroundTableView = UIView()
    private let objectName = UILabel()
    private let objectAddress = UILabel()
    private let objectImage = UIImageView()
    private let ratingLabel = UILabel()
    private var rating: Double = 0
    
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
        rating = object.rating
        ratingLabel.attributedText = objectRating(rating)

    }
    
    // MARK: - Setups
    
    func objectRating(_ rating: Double) -> NSAttributedString {
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
    
    private func addSubviews() {
        contentView.addSubview(backgroundTableView)
        backgroundTableView.addSubview(objectName)
        backgroundTableView.addSubview(objectAddress)
        backgroundTableView.addSubview(ratingLabel)
        backgroundTableView.addSubview(objectImage)
    }
    
    private func setupConstraints() {
        
        backgroundTableView.translatesAutoresizingMaskIntoConstraints = false
        backgroundTableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        backgroundTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        backgroundTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -0).isActive = true
        backgroundTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -0).isActive = true
        backgroundTableView.heightAnchor.constraint(equalToConstant: 71).isActive = true
        
        objectName.translatesAutoresizingMaskIntoConstraints = false
        objectName.topAnchor.constraint(equalTo: backgroundTableView.topAnchor, constant: 5).isActive = true
        objectName.leadingAnchor.constraint(equalTo: backgroundTableView.leadingAnchor, constant: 16).isActive = true
        objectName.widthAnchor.constraint(equalToConstant: 250).isActive = true
        objectName.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        objectAddress.translatesAutoresizingMaskIntoConstraints = false
        objectAddress.topAnchor.constraint(equalTo: objectName.bottomAnchor, constant: 1).isActive = true
        objectAddress.leadingAnchor.constraint(equalTo: backgroundTableView.leadingAnchor, constant: 16).isActive = true
        objectAddress.widthAnchor.constraint(equalToConstant: 250).isActive = true
        objectAddress.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.topAnchor.constraint(equalTo: objectAddress.bottomAnchor, constant: 1).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: backgroundTableView.leadingAnchor, constant: 16).isActive = true
        ratingLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        objectImage.translatesAutoresizingMaskIntoConstraints = false
        objectImage.topAnchor.constraint(equalTo: backgroundTableView.topAnchor, constant: 11).isActive = true
        objectImage.trailingAnchor.constraint(equalTo: backgroundTableView.trailingAnchor, constant: -16).isActive = true
        objectImage.widthAnchor.constraint(equalToConstant: 49).isActive = true
        objectImage.heightAnchor.constraint(equalToConstant: 49).isActive = true
        
    }
    
    private func setupUI() {
        
        contentView.backgroundColor = .white
        backgroundTableView.backgroundColor = .clear
        
        objectImage.contentMode = .scaleToFill
        
        objectName.textAlignment = .left
        objectName.textColor = .black
        objectName.font = .montserrat(16, .semibold)
        objectName.minimumScaleFactor = 0.6
        objectName.adjustsFontSizeToFitWidth = true
        
        objectAddress.textAlignment = .left
        objectAddress.textColor = .black
        objectAddress.minimumScaleFactor = 0.6
        objectAddress.adjustsFontSizeToFitWidth = true
        objectAddress.font = .montserrat(14, .regular)
        
        ratingLabel.textAlignment = .left
    }
}
