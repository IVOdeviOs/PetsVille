import UIKit

final class CareCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CareCollectionViewCell"
    
    private let mainView = UIView()
    private let menuImageView = UIImageView()
    private let menuTextLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(mainView)
        mainView.addAllSubviews(menuTextLabel, menuImageView)
    }
    
    private func addConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        menuImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 10).isActive = true
        menuImageView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        menuImageView.topAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        menuImageView.widthAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 4/10).isActive = true
        
        menuTextLabel.translatesAutoresizingMaskIntoConstraints = false
        menuTextLabel.trailingAnchor.constraint(equalTo: menuImageView.leadingAnchor, constant: 10).isActive = true
        menuTextLabel.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        menuTextLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        menuTextLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        
//        menuTextLabel.font = .
    }
    
}

