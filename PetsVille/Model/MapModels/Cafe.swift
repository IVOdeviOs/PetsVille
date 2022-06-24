import UIKit
struct Cafe {
    let type: String
    let name: String
    let address: String
    let district: String
    let latitude: Double
    let longitude: Double
    let phoneNumber: String
    let rating: Double
    let arrayOfPhoto: [UIImageView]
}

let imbir = Cafe(
    type: "Заведения",
    name: "Имбирь",
    address: "ул. Притыцкого, 2А",
    district: "Фрунзенский",
    latitude: 53.911817,
    longitude: 27.503272,
    phoneNumber: "+375-29-664-51-10",
    rating: 4.2,
    arrayOfPhoto: [UIImageView(image: UIImage(named: ""))]
)

let naUgliah = Cafe(
    type: "Заведения",
    name: "На углях",
    address: "ул. Калиновского, 66А",
    district: "Советский",
    latitude: 53.939165,
    longitude: 27.651001,
    phoneNumber: "+375-29-101-55-53",
    rating: 3.9,
    arrayOfPhoto: [UIImageView(image: UIImage(named: ""))]
)

let sochi = Cafe(
    type: "Заведения",
    name: "Cочи",
    address: "ул. Пономаренко, 35А",
    district: "Фрунзенский",
    latitude: 53.893004,
    longitude: 27.494086,
    phoneNumber: "+375-29-355-75-95",
    rating: 4.1,
    arrayOfPhoto: [UIImageView(image: UIImage(named: ""))]
)
