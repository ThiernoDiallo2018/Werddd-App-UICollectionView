//
//  DataManager.swift
//  Werddd App
//
//  Created by Thierno Diallo on 6/24/23.
//

import Foundation
import CoreData
import UIKit

//Can throw errors if needed

 class DataManager {
     
     enum DataError: Error {
         case general
         case deleteIssues
     }
    
     let managedObjectContext: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()
    
    // - MARK: Create
    
    func createFavoriteWord(from title: String, and wordDetails: apiWordDetail) {
        let favoriteWord = FavoriteWord(context: managedObjectContext)
       
       favoriteWord.title = title
       favoriteWord.definition = wordDetails.definition
       favoriteWord.synonyms = wordDetails.synonyms
       favoriteWord.antonyms = wordDetails.antonyms
       favoriteWord.examples = wordDetails.examples
       favoriteWord.partOfSpeech = wordDetails.partOfSpeech
       favoriteWord.isFavorited = true
       
       
       do {
           try managedObjectContext.save()
       } catch {
           print("System is not able to save word. Failed with error: \(error.localizedDescription)")
       }
    }
    
    
    //  MARK: - Read
    
    //Pulling a list of all of the favorite words we save
    
    func fetchAllWords(completion: ([FavoriteWord]?) -> Void) {
        do {
            let favoriteWords = try managedObjectContext.fetch(FavoriteWord.fetchRequest())
            completion(favoriteWords)
        } catch {
            completion(nil)
        }
    }
    
    
    func fetchFavoriteWord(definition: String, title: String, completion: (FavoriteWord?) -> Void) {
        
        let fetchRequest = NSFetchRequest<FavoriteWord>(entityName: "FavoriteWord")
        fetchRequest.predicate = NSPredicate(format: "definition == %@ AND title == %@", definition, title)
        
        do {
            let favWord = try managedObjectContext.fetch(fetchRequest)
            completion(favWord.first)
        } catch {
            print("Could not fetch due to error: \(error.localizedDescription)")
            completion(nil)
        }
    }
    
    // - MARK: Delete
    
    func deleteAll() throws {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "FavoriteWord")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try managedObjectContext.execute(deleteRequest)
            try managedObjectContext.save()
        } catch {
            throw DataError.deleteIssues
        }
    }
    
    func delete(title: String, definition: String) {
        let fetchRequest: NSFetchRequest<FavoriteWord> = FavoriteWord.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title == %@ AND definition == %@", title, definition)
        
        do {
            let favWord = try managedObjectContext.fetch(fetchRequest)
            for word in favWord {
                managedObjectContext.delete(word)
            }
        } catch {
            print("Could not delete")
        }
    }
    
    func deleteFavoriteWord(_ favoriteWord: FavoriteWord) throws {
        managedObjectContext.delete(favoriteWord)
        
        do {
            try managedObjectContext.save()
        } catch {
            throw DataError.deleteIssues
        }
    }
}
