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
        mainView.addSubview(menuImageView)
        mainView.addSubview(menuTextLabel)
    }
    
    private func addConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        menuImageView.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

