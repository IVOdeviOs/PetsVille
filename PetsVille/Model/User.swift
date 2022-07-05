import Foundation
import UIKit

struct Owner {
    var photo: Data {
        didSet { _ = UIImage(data: photo)! }
    }

    let name: String
    let bDay: Date
    let phoneNumber: String
    let area: String
    let aboutMe: String
}
