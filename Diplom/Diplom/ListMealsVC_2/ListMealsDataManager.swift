//
//  ListMealsDataManager.swift
//  Diplom
//
//  Created by Katerina on 29/01/2024.
//

import Foundation

class ListMealsDataManager {
    
    weak var listMealsVC: ListMealsVC?
    var mealsArray: [CategoriesModel] = []
    
    func loadData(categoryId: String) {
        ApiManager().getListOfMeal(category: categoryId, completion: { (data, error) -> () in
            
            self.mealsArray.removeAll()
            for item in data {
                self.mealsArray.append(item.toCategoryModel())
            }
            self.listMealsVC?.updateData()
        })
    }
    
    func getCount() -> Int {
        return mealsArray.count
    }
}
