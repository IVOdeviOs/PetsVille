import UIKit

let landera = Object(
    type: "Площадки",
    name: "Ландера",
    address: "ул. Ландера",
    district: "Октябрьский",
    latitude: 53.843697,
    longitude: 27.488428,
    isAroundTheClock: true,
    phoneNumber: "",
    rating: 3.6,
    arrayOfPhoto: [UIImageView(image: UIImage(named: ""))]
)

let sobachiaPloschadka = Object(
    type: "Площадки",
    name: "Собачья площадка",
    address: "Зеленый Луг-7",
    district: "Советский",
    latitude: 53.960345,
    longitude: 27.623734,
    isAroundTheClock: true,
    phoneNumber: "",
    rating: 4.3,
    arrayOfPhoto: [UIImageView(image: UIImage(named: ""))]
)

let pogulianka = Object(
    type: "Площадки",
    name: "Погулянка",
    address: "сквер Погулянка",
    district: "Фрунзенский",
    latitude: 53.916804,
    longitude: 27.445602,
    isAroundTheClock: true,
    phoneNumber: "",
    rating: 4.1,
    arrayOfPhoto: [UIImageView(image: UIImage(named: ""))]
)

let arrayOfWalkingGrounds: [Object] = [landera, sobachiaPloschadka, pogulianka]
