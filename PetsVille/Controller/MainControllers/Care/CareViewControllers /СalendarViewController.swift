import UIKit

final class CalendarViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupNavBar()
    }
    
    private func setupNavBar() {
        title = "Календарь"
        navigationController?.navigationBar.layer.cornerRadius = 0
        
    }

}
