
import Foundation
import CoreData

final class CoreDataManager {
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "iOSAvanzadoPractica")
        container.loadPersistentStores { storeDescription, error in
            if let error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return container
    }()
    
    static let shared = CoreDataManager()
    
    func fetchHeroes() -> [CharacterCD] {
        let request = CharacterCD.createFetchRequest()
        
        do {
            let result = try context.fetch(request)
            return result
        } catch {
            print("error getting heroes")
        }
        
        return []
    }
    
    func fetchHero(for id: String) -> CharacterCD? {
        let request = CharacterCD.createFetchRequest()
        let predicate = NSPredicate(format: "id == %@", id)
        request.predicate = predicate
        request.fetchBatchSize = 1
        
        do {
            let result = try context.fetch(request)
            return result.first
        } catch {
            print("error getting hero")
        }
        
        return nil
    }
    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveContext() {
        context.saveContext()
    }
    
    func deleteAll() {
        //Delete object
        saveContext()
    }
}

extension NSManagedObjectContext {
    func saveContext() {
        guard hasChanges else { return }
        do {
            try save()
        } catch {
            fatalError("Error: \(error.localizedDescription)")
        }
    }
}
