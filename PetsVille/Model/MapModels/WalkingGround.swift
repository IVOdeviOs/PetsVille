import UIKit
struct WalkingGround {
    let type: String
    let name: String
    let address: String
    let district: String
    let latitude: Double
    let longitude: Double
    let isAroundTheClock: Bool
    let rating: Double
    let arrayOfPhoto: [UIImageView]
}

let landera = WalkingGround(
    type: "Площадки",
    name: "Ландера",
    address: "ул. Ландера",
    district: "Октябрьский",
    latitude: 53.843697,
    longitude: 27.488428,
    isAroundTheClock: true,
    rating: 3.6,
    arrayOfPhoto: [UIImageView(image: UIImage(named: ""))]
)

let sobachiaPloschadka = WalkingGround(
    type: "Площадки",
    name: "Собачья площадка",
    address: "Зеленый Луг-7",
    district: "Советский",
    latitude: 53.960345,
    longitude: 27.623734,
    isAroundTheClock: true,
    rating: 4.3,
    arrayOfPhoto: [UIImageView(image: UIImage(named: ""))]
)

let pogulianka = WalkingGround(
    type: "Площадки",
    name: "Погулянка",
    address: "сквер Погулянка",
    district: "Фрунзенский",
    latitude: 53.916804,
    longitude: 27.445602,
    isAroundTheClock: true,
    rating: 4.1,
    arrayOfPhoto: [UIImageView(image: UIImage(named: ""))]
)
