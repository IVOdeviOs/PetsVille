import UIKit

final class MapCollectionViewCell: UICollectionViewCell {

    static let identifier = "MapCollectionViewCell"

    // MARK: Private

      let label = UILabel()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API

    func setButtonText(buttonText: String) {
        label.text = buttonText
    }

    // MARK: - Setups

    private func addSubviews() {
        contentView.addSubview(label)
    }

    private func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
    
    }

    private func setupUI() {
        contentView.backgroundColor = .clear
        label.backgroundColor =  UIColor(red: 255/255, green: 188/255, blue: 139/255, alpha: 1)
        label.layer.cornerRadius = 16
        label.layer.masksToBounds = true
        label.font = .montserrat(24, .semibold)
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "Montserrat-Regular", size: 15)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
    }
}
