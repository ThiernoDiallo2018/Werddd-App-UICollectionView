//
//  FavoriteWord+CoreDataProperties.swift
//  Werddd App
//
//  Created by Thierno Diallo on 6/25/23.
//
//

import Foundation
import CoreData


extension FavoriteWord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteWord> {
        return NSFetchRequest<FavoriteWord>(entityName: "FavoriteWord")
    }

    @NSManaged public var title: String?
    @NSManaged public var definition: String?
    @NSManaged public var examples: [String]?
    @NSManaged public var antonyms: [String]?
    @NSManaged public var synonyms: [String]?
    @NSManaged public var partOfSpeech: String?
    @NSManaged public var isFavorited: Bool

}

extension FavoriteWord : Identifiable {

}
