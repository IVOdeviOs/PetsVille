import Foundation
import UIKit

struct Pets {
    var petsPhoto : Data {
        didSet { _ = UIImage(data: petsPhoto)! }
    }

    let nickName: String
    let viewPets: String
    let gender: String
    let breed: String
    let colorPets: String
    let weightPets: String
    let bDayPets: Date
}
