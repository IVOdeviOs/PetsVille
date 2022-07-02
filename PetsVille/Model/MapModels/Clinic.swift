import UIKit
struct Object {
    let type: String
    let name: String
    let address: String
    let district: String
    let latitude: Double
    let longitude: Double
    let isAroundTheClock: Bool
    let phoneNumber: String
    let rating: Double
    let arrayOfPhoto: [UIImageView]
}

let aibolit = Object(
    type: "Клиники",
    name: "Айболит",
    address: "ул. Колесникова, 18",
    district: "Фрунзенский",
    latitude: 53.919320,
    longitude: 27.438450,
    isAroundTheClock: false,
    phoneNumber: "+375-33-376-44-24",
    rating: 5.0,
    arrayOfPhoto: [
        UIImageView(image: UIImage(named: "aibolit1")),
        UIImageView(image: UIImage(named: "aibolit2")),
        UIImageView(image: UIImage(named: "aibolit3"))
    ]
)

let nineLifes = Object(
    type: "Клиники",
    name: "Девять жизней",
    address: "ул. Осиповичская, 7",
    district: "Октябрьский",
    latitude: 53.849468,
    longitude: 27.541170,
    isAroundTheClock: false,
    phoneNumber: "+375-33-344-23-43",
    rating: 3.4,
    arrayOfPhoto: [
        UIImageView(image: UIImage(named: "9lifes1")),
        UIImageView(image: UIImage(named: "9lifes2")),
        UIImageView(image: UIImage(named: "9lifes3"))
    ]
)

let doctorVet = Object(
    type: "Клиники",
    name: "Доктор Вет",
    address: "Подшипниковый пр., 9",
    district: "Заводской",
    latitude: 53.865052,
    longitude: 27.627684,
    isAroundTheClock: true,
    phoneNumber: "+375-29-160-26-02",
    rating: 4.6,
    arrayOfPhoto: [UIImageView(image: UIImage(named: "drVet1")),
                   UIImageView(image: UIImage(named: "drVet2")),
                   UIImageView(image: UIImage(named: "drVet3"))
                  ]
)

let arrayOfClinics: [Object] = [aibolit, nineLifes, doctorVet]
