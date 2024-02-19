//
//  SelectedCategoriesVModel.swift
//  Diplom
//
//  Created by Katerina on 25/01/2024.
//

import Foundation
class CategoriesDataManager {

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
    
var categoriesArray: [CategoriesModel] = []
    
    init() {
        for (i, _) in categoriesIdArray.enumerated() {
            var model = CategoriesModel()
            model.categoryId = categoriesIdArray[i]
            model.title = titleArray[i]
            model.imageName = categoriesIdArray[i]
            
            categoriesArray.append(model)
        }
    }
    
     func getCount() -> Int {
        return categoriesArray.count
    }
}
