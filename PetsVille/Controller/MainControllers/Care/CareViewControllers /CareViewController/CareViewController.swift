import UIKit

struct Menu {
    let image: UIImage
    let title: String
}

final class CareViewController: UIViewController {

    private lazy var menuCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    
    private let layout = UICollectionViewFlowLayout()
    
    private let dataSource: [Menu] = [
        Menu(image: UIImage(imageLiteralResourceName: "Nursing"), title: "Уход"),
        Menu(image: UIImage(imageLiteralResourceName: "Medicine"), title: "Медицина"),
        Menu(image: UIImage(imageLiteralResourceName: "Calendar"), title: "Календарь"),
        Menu(image: UIImage(imageLiteralResourceName: "Subscription"), title: "Подписка")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        setupMenuCollectionView()
    }
    
    private func addSubviews() {
        view.addSubview(menuCollectionView)
    }
    
    private func addConstraints() {
        menuCollectionView.translatesAutoresizingMaskIntoConstraints = false
        menuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        menuCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        menuCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 60).isActive = true
    }

    private func setupMenuCollectionView() {
        menuCollectionView.register(CareCollectionViewCell.self, forCellWithReuseIdentifier: CareCollectionViewCell.identifier)
        layout.scrollDirection = .vertical
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
        
        menuCollectionView.backgroundColor = .clear
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
    }
    
    private func setupSearchController() {
    }
}


extension CareViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CareCollectionViewCell.identifier, for: indexPath) as? CareCollectionViewCell {
            cell.setInfo(dataSource[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let itemPerRow: CGFloat = 3
//        let paddingWidth = 10 * (itemPerRow + 1)
//        let widthForItem = collectionView.frame.width - paddingWidth
//        
        let width = view.frame.width * 0.75
        let heigth = view.frame.height * 0.15
        
        return CGSize(width: width, height: heigth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 3, bottom: 10, right: 3)
    }
    
}
