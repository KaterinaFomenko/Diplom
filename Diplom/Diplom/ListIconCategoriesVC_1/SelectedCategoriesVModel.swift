//
//  SelectedCategoriesVModel.swift
//  Diplom
//
//  Created by Katerina on 25/01/2024.
//

import Foundation
class SelectedCategoriesVModel {
    
private let categoriesIdArray = ["Beef",
                       "Breakfast",
                       "Chicken",
                       "Dessert",
                       "Lamb",
                       "Miscellaneous",
                       "Pasta",
                       "Pork",
                       "Seafood",
                       "Side",
                       "Starter",
                       "Vegan",
                       "Vegetarian"]
    
private let titleArray = ["Beef",
                           "Breakfast",
                           "Chicken",
                           "Dessert",
                           "Lamb",
                           "Miscellaneous",
                           "Pasta",
                           "Pork",
                           "Sea food",
                           "Side",
                           "Starter",
                           "Vegan",
                           "Vegetarian"]
    
    
    private var categoriesArray: [CategoriesModel] = []
    
    init() {
        for (i, _) in categoriesIdArray.enumerated() {
            let model = CategoriesModel()
            model.categoryId = categoriesIdArray[i]
            model.title = titleArray[i]
            model.imageName = categoriesIdArray[i]
            
            categoriesArray.append(model)
            print("categoriesArray \(categoriesArray)")
        }
    }
    
    func  getCategory(index: Int) -> CategoriesModel {
        return categoriesArray[index] 
    }
    
    func getCount() -> Int {
        return categoriesArray.count
    }
}