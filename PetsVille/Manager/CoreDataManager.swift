import CoreData
import UIKit

final class CoreDataManager {
    static let instance = CoreDataManager()

    func savePerson(_ user: Owner) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let managerContext = appDelegate.persistentContainer.viewContext

        let entity = NSEntityDescription.entity(forEntityName: "OwnerEntity", in: managerContext)!

        let users = NSManagedObject(entity: entity, insertInto: managerContext)
       
        
        users.setValue(user.name, forKey: "name")
        users.setValue(user.bDay, forKey: "bDay")
        users.setValue(user.phoneNumber, forKey: "phoneNumber")
        users.setValue(user.area, forKey: "area")
        users.setValue(user.photo, forKey: "photo")
        users.setValue(user.aboutMe, forKey: "aboutMe")

        do {
            try managerContext.save()
        } catch let error as NSError {
            print("error- \(error)")
        }
    }

    func getPerson() -> [Owner]? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }

        let managerContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "OwnerEntity")

        do {
            let object = try managerContext.fetch(fetchRequest)
            var users = [Owner]()
            for object in object {
                guard let name = object.value(forKey: "name") as? String,
                      let bDay = object.value(forKey: "bDay") as? Date,
                      let area = object.value(forKey: "area") as? String,
                      let aboutMe = object.value(forKey: "aboutMe") as? String,
                      let phoneNumber = object.value(forKey: "phoneNumber") as? String,
                      let photo = object.value(forKey: "photo") as? Data else { return nil }
                let user = Owner(photo: photo, name: name, bDay: bDay, phoneNumber: phoneNumber, area: area, aboutMe: aboutMe)
                users.insert(user, at: 0)
            }
            return users
        } catch let error as NSError {
            print("Error-\(error)")
        }
        return nil
    }
}
