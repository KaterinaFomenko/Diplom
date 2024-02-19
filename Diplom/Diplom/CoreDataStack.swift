//
//  CoreDataStack.swift
//  Diplom
//
//  Created by Katerina on 10/02/2024.
//

import Foundation
import CoreData

class CoreDataStack {
    
    lazy var persistentContainer: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: {(_, error) in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error.localizedDescription)")
            }
        })
        return container
    }()
    
    lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    static func save(_ recipe: CategoriesModel) {
        let coreDataStack = CoreDataStack()
        let context = coreDataStack.context
        
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "CategoriesEntity",
                                                           in: context) else { return }
        let entityObject = CategoriesEntity(entity: entityDescription, insertInto: context)
       
        entityObject.categoryId = recipe.categoryId
        entityObject.imageName = recipe.imageName
        entityObject.title = recipe.title
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Save note error: \(error.localizedDescription)")
        }
    }
    
    static func delete(_ meal: CategoriesModel) {
        let coreDataStack = CoreDataStack()
        let context = coreDataStack.context
        
        let fetchRequest: NSFetchRequest<CategoriesEntity> = CategoriesEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "categoryId = %@", meal.categoryId)
        
        do {
            let result = try context.fetch(fetchRequest)
            guard let entityObject = result.first else { return }
            context.delete(entityObject)
            try context.save()
        } catch {
            print("Delete error: \(error.localizedDescription)")
        }
    }
    
    static func fetchAll() -> [CategoriesEntity] {
        let coreDataStack = CoreDataStack()
        let context = coreDataStack.context
        
        let fetchRequest: NSFetchRequest<CategoriesEntity> = CategoriesEntity.fetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest)
//            result.map { CategoriesModel(categoryId: $0.categoryId ?? "", title: $0.title ?? "", imageName: $0.imageName ?? "") }
            return result
        } catch {
            print("Fetch error: \(error.localizedDescription)")
            return []
        }
    }
    
    static func isObjectInCoreData(categoryId: String) -> Bool {
        let coreDataStack = CoreDataStack()
        let fetchRequest: NSFetchRequest<CategoriesEntity> = CategoriesEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "categoryId == %@", categoryId)
        
        do {
            let context = coreDataStack.context
            let results = try context.fetch(fetchRequest)
            return results.count > 0 
        } catch {
            print("Ошибка при выполнении запроса: \(error.localizedDescription)")
            return false
        }
    }
}

