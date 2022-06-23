import UIKit
import MapKit
import CoreLocation

final class MapViewController: UIViewController {

    // MARK: Private
    
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    private let arrayOfClinics: [VetClinic] = [aibolit, nineLifes, doctorVet]
    private let arrayOfShops: [Shop] = [bestFish, zooBazar, priroda]
    private let arrayOfWalkingGrounds: [WalkingGround] = [landera, sobachiaPloschadka, pogulianka]
    private let arrayOfCafes: [Cafe] = [imbir, naUgliah, sochi]
    private var arrayOfClinicsPoints = [MKPointAnnotation()]
    private var arrayOfShopsPoints = [MKPointAnnotation()]
    private var arrayOfWalkingGroundsPoints = [MKPointAnnotation()]
    private var arrayOfCafePoints = [MKPointAnnotation()]

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        addSubviews()
        addConstraints()
        setupUI()
    }
    
    // MARK: - Setups
   
    private func addSubviews() {
        view.addSubview(mapView)
    }
    
    private func addConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupUI() {
        
//        userLocation
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        let myLatitude = locationManager.location?.coordinate.latitude
        let myLongitude = locationManager.location?.coordinate.longitude
        let myLocation = CLLocationCoordinate2D(
            latitude: myLatitude ?? 53.904541,
            longitude: myLongitude ?? 27.561523
        )
        let coordinatesRegion = MKCoordinateRegion(
            center: myLocation,
            latitudinalMeters: 300,
            longitudinalMeters: 300
        )
        mapView.setRegion(coordinatesRegion, animated: true)
        
//        objectsPoints
        
        for clinic in arrayOfClinics {
            let point = MKPointAnnotation()
            point.coordinate = CLLocationCoordinate2D(latitude: clinic.latitude, longitude: clinic.longitude)
            mapView.addAnnotation(point)
            arrayOfClinicsPoints.append(point)
        }
        
        for shop in arrayOfShops {
            let point = MKPointAnnotation()
            point.coordinate = CLLocationCoordinate2D(latitude: shop.latitude, longitude: shop.longitude)
            mapView.addAnnotation(point)
            arrayOfShopsPoints.append(point)
        }
        
        for ground in arrayOfWalkingGrounds {
            let point = MKPointAnnotation()
            point.coordinate = CLLocationCoordinate2D(latitude: ground.latitude, longitude: ground.longitude)
            mapView.addAnnotation(point)
            arrayOfWalkingGroundsPoints.append(point)
        }
        
        for cafe in arrayOfCafes {
            let point = MKPointAnnotation()
            point.coordinate = CLLocationCoordinate2D(latitude: cafe.latitude, longitude: cafe.longitude)
            mapView.addAnnotation(point)
            arrayOfCafePoints.append(point)
        }
    }
}

// MARK: - Helpers

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        return nil
    }
}
