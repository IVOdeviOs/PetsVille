import UIKit

struct Menu {
    let image: UIImage
    let title: String
}

final class CareViewController: UIViewController {

    private let menuCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    private let layout = UICollectionViewLayout()
    
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
        menuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setupMenuCollectionView() {
        menuCollectionView.register(UINib(nibName: CareCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CareCollectionViewCell.identifier)
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
    }
}


extension CareViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CareCollectionViewCell.identifier, for: indexPath) as? CareCollectionViewCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
}
