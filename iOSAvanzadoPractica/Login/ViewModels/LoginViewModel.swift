
import Foundation
import KeychainSwift


class LoginViewModel {
    
    let network: NetworkModel?
    var keyChain: KeychainSwift
    
    var coreDataManager: CoreDataManager
    var content: [Hero] = []
    
    init(network: NetworkModel?, keyChain: KeychainSwift = KeychainSwift(), coreDataManager: CoreDataManager = CoreDataManager()) {
        self.network = network ?? NetworkModel()
        self.keyChain = keyChain
        self.coreDataManager = coreDataManager
    }
    
    func signIn(email: String, password: String, completion: @escaping (_ token: String) -> Void) {
        network?.login(user: email, password: password) { token, error in
            self.keyChain.set(token ?? "fakeToken", forKey: "KCToken")
            print("llego 1")
            self.saveHeroes()
        }
    }
    
    func saveHeroes() {
        network?.getHeroes(completion: { heroes, error in
            print(error)
            print(heroes)
            heroes.forEach { hero in
                print(hero)
                self.network?.getLocalizacionHeroe(id: hero.id, completion: { coordenates, error in
                    let character = Hero(photo: hero.photo,
                                         id: hero.id,
                                         favorite: hero.favorite,
                                         name: hero.name,
                                         description: hero.description,
                                         latitude: Double(coordenates.first?.latitude ?? "0.0") ?? 0.0,
                                         longitude: Double(coordenates.first?.longitud ?? "0.0") ?? 0.0)
                    
                    _ = CharacterCD.createCharacterCD(from: character, context: self.coreDataManager.context)
                    self.coreDataManager.saveContext()
                })
            }
        })
    }
    
    func saveToken(token: String) {
        let data = Data(token.utf8)
        keyChain.set(data, forKey: "KCToken")
    }
}

extension LoginViewModel {
    func save(heroes: [Hero]) {
        _ = heroes.map { CharacterCD.createCharacterCD(from: $0, context: coreDataManager.context)}
        coreDataManager.saveContext()
    }
}
