import UIKit
import FSCalendar

final class CalendarViewController: UIViewController {
    
    private let navBarAppearence = UINavigationBarAppearance()
    private var calendar = FSCalendar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        addSubview()
        setupCalendar()
        addConstraints()
    }
    
    private func addSubview() {
        view.addSubview(calendar)
    }
    
    private func addConstraints() {
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        calendar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 5/10).isActive = true
    }
    
    private func setupNavBar() {
        title = "Календарь"
        //        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"),
        //                                                           style: .plain,
        //                                                           target: self,
        //                                                           action: #selector(questionPopUpWindow))
        navigationItem.leftBarButtonItem?.tintColor = .orange
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(questionButton))
        navigationItem.rightBarButtonItem?.tintColor = .orange
        
        navBarAppearence.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        navBarAppearence.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearence.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearence
        navigationController?.navigationBar.layer.cornerRadius = 20
    }
    
    private func setupCalendar() {
        calendar.scrollDirection = .horizontal
        calendar.scope = .month
    }
    
    @objc private func questionButton() {
        
    }
}
