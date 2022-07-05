import Foundation
import UIKit

struct User {
    var photo: Data {
        didSet { _ = UIImage(data: photo)! }
    }

    let name: String
    let bDay: Date
    let phoneNumber: String
    let area: String
    let aboutMe: String
}
