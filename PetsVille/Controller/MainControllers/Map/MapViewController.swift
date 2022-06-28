import UIKit
import MapKit
import CoreLocation

final class MapViewController: UIViewController {
    
    // MARK: Private
    
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    private var arrayOfClinics: [VetClinic] = [aibolit, nineLifes, doctorVet]
    private var arrayOfShops: [Shop] = [bestFish, zooBazar, priroda]
    private var arrayOfWalkingGrounds: [WalkingGround] = [landera, sobachiaPloschadka, pogulianka]
    private var arrayOfCafes: [Cafe] = [imbir, naUgliah, sochi]
    private var arrayOfClinicAnnotations = [MyAnnotation]()
    private var arrayOfShopAnnotations = [MyAnnotation]()
    private var arrayOfWalkingGroundsAnnotations = [MyAnnotation]()
    private var arrayOfCafeAnnotations = [MyAnnotation]()
    private lazy var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    private let layout = UICollectionViewFlowLayout()
    private var arrayOfButtons: [String] = ["Клиники", "Зоомагазины", "Заведения", "Площадки"] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        addSubviews()
        addConstraints()
        addingPointsIntoTheMap()
        setupCollectionView()

    }
    
    // MARK: - Setups
    
    private func addSubviews() {
        view.addSubview(mapView)
        view.addSubview(collectionView)
    }
    
    private func addConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 111).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
    
        private func addingPointsIntoTheMap() {
        //        userLocation
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        
        let coordinatesRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 53.902284,
                longitude: 27.561831
            ),
            latitudinalMeters: 13000,
            longitudinalMeters: 13000
        )
        mapView.setRegion(coordinatesRegion, animated: true)
        
        //        objectsPoints
        
        for clinic in arrayOfClinics {
            let marker = MyAnnotation(
                title: "title",
                subtitle: "subtitle",
                coordinate: CLLocationCoordinate2D(
                    latitude: clinic.latitude,
                    longitude: clinic.longitude
                )
            )
            let image = UIImage(named: "hospital")
            let resizedImage = image?.resized(to: CGSize(width: 40, height: 40))
            marker.image = resizedImage
            arrayOfClinicAnnotations.append(marker)
            self.mapView.addAnnotations(arrayOfClinicAnnotations)
        }
        
        for shop in arrayOfShops {
            let marker = MyAnnotation(
                title: "title",
                subtitle: "subtitle",
                coordinate: CLLocationCoordinate2D(
                    latitude: shop.latitude,
                    longitude: shop.longitude
                )
            )
            let image = UIImage(named: "shop")
            let resizedImage = image?.resized(to: CGSize(width: 40, height: 40))
            marker.image = resizedImage
            arrayOfShopAnnotations.append(marker)
            self.mapView.addAnnotations(arrayOfShopAnnotations)
        }
        
        for ground in arrayOfWalkingGrounds {
            let marker = MyAnnotation(
                title: "title",
                subtitle: "subtitle",
                coordinate: CLLocationCoordinate2D(
                    latitude: ground.latitude,
                    longitude: ground.longitude
                )
            )
            let image = UIImage(named: "walkingGround")
            let resizedImage = image?.resized(to: CGSize(width: 40, height: 40))
            marker.image = resizedImage
            arrayOfWalkingGroundsAnnotations.append(marker)
            self.mapView.addAnnotations(arrayOfWalkingGroundsAnnotations)
        }
        
        for cafe in arrayOfCafes {
            let marker = MyAnnotation(
                title: "title",
                subtitle: "subtitle",
                coordinate: CLLocationCoordinate2D(
                    latitude: cafe.latitude,
                    longitude: cafe.longitude
                )
            )
            let image = UIImage(named: "cafe")
            let resizedImage = image?.resized(to: CGSize(width: 40, height: 40))
            marker.image = resizedImage
            arrayOfCafeAnnotations.append(marker)
            self.mapView.addAnnotations(arrayOfCafeAnnotations)
        }
    }
        
    private func setupCollectionView() {
        collectionView.register(MapCollectionViewCell.self, forCellWithReuseIdentifier: MapCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = layout
        layout.itemSize = CGSize(width: 110, height: 32)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
    }
}

// MARK: - Helpers

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? MyAnnotation {
            let identifier = "identifier"
            var annotationView: MKAnnotationView?
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.image = annotation.image
            annotationView?.canShowCallout = false
            annotationView?.calloutOffset = CGPoint(x: -5, y: 5)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            return annotationView
        }
        return nil
    }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

extension MapViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfButtons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MapCollectionViewCell.identifier, for: indexPath) as? MapCollectionViewCell {
            cell.setButtonText(buttonText: arrayOfButtons[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MapCollectionViewCell.identifier, for: indexPath) as? MapCollectionViewCell {
            switch arrayOfButtons[indexPath.row] {
            case "Клиники":
        arrayOfButtons[0] = arrayOfButtons[indexPath.row]
        arrayOfButtons[1] = "Список"
        arrayOfButtons[2] = "Открыто"
        arrayOfButtons[3] = "С фото"
            cell.label.backgroundColor = .red
                mapView.removeAnnotations(arrayOfCafeAnnotations)
                mapView.removeAnnotations(arrayOfShopAnnotations)
                mapView.removeAnnotations(arrayOfWalkingGroundsAnnotations)
            case "Зоомагазины":
        arrayOfButtons[0] = arrayOfButtons[indexPath.row]
        arrayOfButtons[1] = "Список"
        arrayOfButtons[2] = "Открыто"
        arrayOfButtons[3] = "С фото"
            cell.label.backgroundColor = .red
                mapView.removeAnnotations(arrayOfCafeAnnotations)
                mapView.removeAnnotations(arrayOfClinicAnnotations)
                mapView.removeAnnotations(arrayOfWalkingGroundsAnnotations)
            case "Заведения":
        arrayOfButtons[0] = arrayOfButtons[indexPath.row]
        arrayOfButtons[1] = "Список"
        arrayOfButtons[2] = "Открыто"
        arrayOfButtons[3] = "С фото"
            cell.label.backgroundColor = .red
                mapView.removeAnnotations(arrayOfClinicAnnotations)
                mapView.removeAnnotations(arrayOfShopAnnotations)
                mapView.removeAnnotations(arrayOfWalkingGroundsAnnotations)
            case "Площадки":
        arrayOfButtons[0] = arrayOfButtons[indexPath.row]
        arrayOfButtons[1] = "Список"
        arrayOfButtons[2] = "Открыто"
        arrayOfButtons[3] = "С фото"
            cell.label.backgroundColor = .red
                mapView.removeAnnotations(arrayOfCafeAnnotations)
                mapView.removeAnnotations(arrayOfShopAnnotations)
                mapView.removeAnnotations(arrayOfClinicAnnotations)
                
            default:
                break
    }
    }
    }

}
