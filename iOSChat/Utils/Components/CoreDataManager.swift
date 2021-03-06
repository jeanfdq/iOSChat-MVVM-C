//
//  CoreDataManager.swift
//  iOSChat
//
//  Created by Jean Paul Borges Manzini on 25/03/21.
//

import UIKit
import CoreData

class CoreDataManager: NSObject, NSFetchedResultsControllerDelegate {
    
    static let shared = CoreDataManager()
    
    func context() -> NSManagedObjectContext {
        
        var context:NSManagedObjectContext {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.persistentContainer.viewContext
            
        }
        return context
    }
    
    func create<T: NSManagedObject>(_ model: T.Type) -> (NSManagedObjectContext, T?) {
        
        let contextCoreData = context()
        
        let entityDescription =  NSEntityDescription.entity(forEntityName: String.init(describing: model.self),
                                                            in: contextCoreData)
        let entity = NSManagedObject(entity: entityDescription!,
                                     insertInto: contextCoreData)
        let entityModel = entity as? T
        return (contextCoreData, entityModel)
    }
    
    @discardableResult
    func save( context: NSManagedObjectContext ) -> Bool {
        
        do{
            try context.save()
            return true
        }catch{
            print(error.localizedDescription)
            return false
        }
    }
    
    
    func udpateFieldData(email: String, field: String, value: Data) {
        let contextUpdate = context()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "userEmail == %@", email)
        fetchRequest.returnsObjectsAsFaults = false
        if let searchResult = try? contextUpdate.fetch(fetchRequest) as? [NSManagedObject] {
            if searchResult.count > 0 {
                searchResult[0].setValue(value, forKey: field)
                save(context: contextUpdate)
            }
        }
    }
    
    func udpateFieldString(email: String, field: String, value: String) {
        let contextUpdate = context()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "userEmail == %@", email)
        fetchRequest.returnsObjectsAsFaults = false
        if let searchResult = try? contextUpdate.fetch(fetchRequest) as? [NSManagedObject] {
            if searchResult.count > 0 {
                searchResult[0].setValue(value, forKey: field)
                save(context: contextUpdate)
            }
        }
    }
    
    enum settingsFields: String {
        case pushNotification = "allowNotification"
        case faceID = "allowFaceId"
    }
    func udpateFieldSettingsBool( field: settingsFields, value: Bool) {
        let contextUpdate = context()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Settings")
        fetchRequest.returnsObjectsAsFaults = false
        if let searchResult = try? contextUpdate.fetch(fetchRequest) as? [NSManagedObject] {
            if searchResult.count > 0 {
                searchResult[0].setValue(value, forKey: field.rawValue)
                save(context: contextUpdate)
            }
        }
    }
    
    func delete<T: NSManagedObject>(_ model: T) -> Bool {
        
        let contextDelete = context()
        contextDelete.delete(model)
        
        return save(context: contextDelete)
    }
    
    // let lista = CoreDataManager.shared.fetchData(User.self, predicate: NSPredicate(format: "userFullName == %@", "Jean2222")) //Jean22222
    func fetchData<T: NSManagedObject>(_ entity: T.Type, predicate: NSPredicate? = nil) -> [T] {
        
        let fetchRequest = NSFetchRequest<T>(entityName: NSStringFromClass(T.self))
        
        if predicate != nil {
            fetchRequest.predicate = predicate
        }
        
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            
            let searchResult = try context().fetch(fetchRequest)
            return searchResult
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
}
