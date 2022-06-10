import UIKit

final class MainTabBarController: UITabBarController {

    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    private let careViewController = UINavigationController(rootViewController: CareViewController())
    private let mapViewController = UINavigationController(rootViewController: MapViewController())
    private let profileViewController = UINavigationController(rootViewController: ProfileViewController())
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
        
    }
    // MARK: - API
    
    // MARK: - Setups
    private func setupTabBarController(){
        setViewControllers([careViewController,mapViewController, profileViewController], animated: true)
        setupUITabBar()
    }
    private func setupUITabBar(){
        careViewController.tabBarItem.image = UIImage(systemName: "pawprint")
        careViewController.title = "Забота"
        mapViewController.tabBarItem.image = UIImage(systemName: "map")
        mapViewController.title = "Карта"
        profileViewController.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        profileViewController.title = "Профиль"
        tabBar.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        tabBar.layer.cornerRadius = 20
        tabBar.tintColor = .orange
    }
    
    // MARK: - Helpers
    
}
