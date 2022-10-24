//
//  CharacterCD+CoreDataProperties.swift
//  iOSAvanzadoPractica
//
//  Created by Rodrigo Latorre on 24/10/22.
//
//

import Foundation
import CoreData


extension CharacterCD {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<CharacterCD> {
        return NSFetchRequest<CharacterCD>(entityName: "CharacterCD")
    }

    @NSManaged public var photo: URL
    @NSManaged public var favorite: Bool
    @NSManaged public var id: String
    @NSManaged public var desc: String
    @NSManaged public var name: String
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}

extension CharacterCD : Identifiable {

}
