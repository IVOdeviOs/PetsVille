import UIKit

let bestFish = Object(
    type: "Зоомагазины",
    name: "Бест Фиш",
    address: "просп. Дзержинского, 123",
    district: "Московский",
    latitude: 53.848124,
    longitude: 27.476404,
    isAroundTheClock: false,
    phoneNumber: "+375-29-662-16-67",
    rating: 3.5,
    arrayOfPhoto: [UIImageView(image: UIImage(named: "bestFish1")),
                   UIImageView(image: UIImage(named: "bestFish2")),
                   UIImageView(image: UIImage(named: "bestFish3"))
                  ]
)

let zooBazar = Object(
    type: "Зоомагазины",
    name: "zoobazar",
    address: "ул. Волоха, 2",
    district: "Московский",
    latitude: 53.898444,
    longitude: 27.524711,
    isAroundTheClock: false,
    phoneNumber: "+375-44-516-18-57",
    rating: 4.4,
    arrayOfPhoto: [UIImageView(image: UIImage(named: "zooBazar1")),
                   UIImageView(image: UIImage(named: "zooBazar2")),
                   UIImageView(image: UIImage(named: "zooBazar3"))
                  ]
)

let priroda = Object(
    type: "Зоомагазины",
    name: "Природа",
    address: "просп. Независимости, 89",
    district: "Первомайский",
    latitude: 923019,
    longitude: 27.605924,
    isAroundTheClock: false,
    phoneNumber: "+375-17-251-00-63",
    rating: 5.0,
    arrayOfPhoto: [UIImageView(image: UIImage(named: "priroda1")),
                   UIImageView(image: UIImage(named: "priroda2")),
                   UIImageView(image: UIImage(named: "priroda3"))
                  ]
)

let arrayOfShops: [Object] = [bestFish, zooBazar, priroda]
