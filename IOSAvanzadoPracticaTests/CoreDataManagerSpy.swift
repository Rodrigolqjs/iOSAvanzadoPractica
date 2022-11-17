
import Foundation
@testable import IOSAvanzadoPractica

extension CoreDataManager {
    
    override func fetchHeroes(test: String) -> [CharacterCD] {
        if (test == "test") {
            CharacterCD.createCharacterCD(from: <#T##Hero#>, context: <#T##NSManagedObjectContext#>)
            return CharacterCD()
        }
        return
    }
    
}
