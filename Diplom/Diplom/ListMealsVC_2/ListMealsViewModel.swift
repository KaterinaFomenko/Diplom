//
//  ListMealsViewModel.swift
//  Diplom
//
//  Created by Katerina on 29/01/2024.
//

import Foundation

class ListMealsViewModel {
    
    var listMealsVC: ListMealsVC?
    var mealsList: [CategoriesModel] = []
    
    func loadData(categoryId: String) {
        ApiManager().getListOfMeal(category: categoryId, completion: { (data, error) -> () in
          
            self.mealsList.removeAll()
            for item in data {
                self.mealsList.append(item.toCategoryModel())
            }
            self.listMealsVC?.updateData()
        })
    }
    
    func getMeal(index: Int) -> CategoriesModel {
        return mealsList[index]
    }
    
    func getCount() -> Int {
        return mealsList.count
    }
}
