import UIKit
struct Shop {
    let name: String
    let address: String
    let district: String
    let latitude: Double
    let longitude: Double
    let phoneNumber: String
    let rating: Double
    let arrayOfPhoto: [UIImageView]
}

let bestFish = Shop(
    name: "Бест Фиш",
    address: "просп. Дзержинского, 123",
    district: "Московский",
    latitude: 53.848124,
    longitude: 27.476404,
    phoneNumber: "+375-29-662-16-67",
    rating: 4.9,
    arrayOfPhoto: [UIImageView(image: UIImage(named: ""))]
)

let zooBazar = Shop(
    name: "zoobazar",
    address: "ул. Волоха, 2",
    district: "Московский",
    latitude: 53.898444,
    longitude: 27.524711,
    phoneNumber: "+375-44-516-18-57",
    rating: 4.4,
    arrayOfPhoto: [UIImageView(image: UIImage(named: ""))]
)

let priroda = Shop(
    name: "Природа",
    address: "просп. Независимости, 89",
    district: "Первомайский",
    latitude: 53.923019,
    longitude: 27.605924,
    phoneNumber: "+375-17-251-00-63",
    rating: 4.3,
    arrayOfPhoto: [UIImageView(image: UIImage(named: ""))]
)
