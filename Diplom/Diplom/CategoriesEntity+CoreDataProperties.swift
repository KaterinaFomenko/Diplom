//
//  CategoriesEntity+CoreDataProperties.swift
//  Diplom
//
//  Created by Katerina on 10/02/2024.
//
//

import Foundation
import CoreData


extension CategoriesEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoriesEntity> {
        return NSFetchRequest<CategoriesEntity>(entityName: "CategoriesEntity")
    }

    @NSManaged public var categoryId: String?
    @NSManaged public var title: String?
    @NSManaged public var imageName: String?
}

extension CategoriesEntity : Identifiable {

}
