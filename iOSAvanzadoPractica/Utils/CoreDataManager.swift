import Foundation
import CoreData
import UIKit

class CoreDataManager {
    private let container: NSPersistentContainer

    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        container = appDelegate.persistentContainer
    }

    func createHero(heroes: [Hero], completion: (() -> Void)? = nil) {
        let context = container.viewContext

        for hero in heroes {
            let heroCD = Hero(context: context)
            heroCD.photo = hero.photo.absoluteString
            heroCD.id = hero.id
            heroCD.favorite = hero.favorite
            heroCD.name = hero.name
            heroCD.longitude = hero.longitude ?? 0.0
            heroCD.latitude = hero.latitud ?? 0.0
        }

        do {
            try context.save()
            print("Heroes guardado: \(heroes)")
            completion?()
        } catch {
          print("Error guardando usuario — \(error)")
        }
    }

    func fetchHeroe(with predicate:NSPredicate) -> [Hero] {
        let fetchRequest: NSFetchRequest<Hero> = Hero.fetchRequest()
        fetchRequest.predicate = predicate
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            return result
        } catch {
            print("El error obteniendo Heroe \(error)")
         }
         return []
    }

    func fetchHeroe() -> [Hero] {
        let fetchRequest: NSFetchRequest<Hero> = Hero.fetchRequest()
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            return result
        } catch {
            print("El error obteniendo Heroe \(error)")
         }
         return []
    }

    func deleteCoreData(entityName: String) {
        let context:NSManagedObjectContext = container.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for managedObject in results {
                if let managedObjectData: NSManagedObject = managedObject as? NSManagedObject {
                    context.delete(managedObjectData)
                }
            }
        } catch let error as NSError {
            print("Deleted all my data in myEntity error : \(error) \(error.userInfo)")
        }
    }
}
