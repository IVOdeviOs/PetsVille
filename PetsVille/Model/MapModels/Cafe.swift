import UIKit

let imbir = Object(
    type: "Заведения",
    name: "Имбирь",
    address: "ул. Притыцкого, 2А",
    district: "Фрунзенский",
    latitude: 53.911817,
    longitude: 27.503272,
    isAroundTheClock: false,
    phoneNumber: "+375-29-664-51-10",
    rating: 2.2,
    arrayOfPhoto: [UIImageView(image: UIImage(named: ""))]
)

let naUgliah = Object(
    type: "Заведения",
    name: "На углях",
    address: "ул. Калиновского, 66А",
    district: "Советский",
    latitude: 53.939165,
    longitude: 27.651001,
    isAroundTheClock: false,
    phoneNumber: "+375-29-101-55-53",
    rating: 3.9,
    arrayOfPhoto: [UIImageView(image: UIImage(named: ""))]
)

let sochi = Object(
    type: "Заведения",
    name: "Cочи",
    address: "ул. Пономаренко, 35А",
    district: "Фрунзенский",
    latitude: 53.893004,
    longitude: 27.494086,
    isAroundTheClock: false,
    phoneNumber: "+375-29-355-75-95",
    rating: 4.1,
    arrayOfPhoto: [UIImageView(image: UIImage(named: ""))]
)

let arrayOfCafes: [Object] = [imbir, naUgliah, sochi]
