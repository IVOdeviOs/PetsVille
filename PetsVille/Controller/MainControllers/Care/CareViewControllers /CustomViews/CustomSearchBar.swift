import UIKit

final class CustomSearchBar: UISearchBar {
    
    private let searchBar = UISearchBar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        searchBar.searchTextField.backgroundColor = .white
        searchBar.placeholder = "  Поиск"
        searchBar.searchTextField.font = .montserrat(17, .regular)
//        searchBar.delegate = self
        searchBar.showsBookmarkButton = true
        searchBar.setImage(UIImage(systemName: "location"), for: .bookmark, state: .normal)
        searchBar.searchTextField.layer.borderWidth = 1
        searchBar.searchTextField.layer.borderColor = AppColor.orangeColor.cgColor
        searchBar.searchTextField.layer.cornerRadius = 10
}
}
