//
//  ListMealsViewModel.swift
//  Diplom
//
//  Created by Katerina on 29/01/2024.
//

import Foundation

class ListMealsViewModel {
    
    var mealsList: [CategoriesModel] = []
    var listMealsVC: ListMealsVC?
    
    func loadData(categoryId: String) {
        ApiManager().getListOfMeal(category: categoryId, complition: { (data, error) -> () in
          
            self.mealsList.removeAll()
            for item in data {
                let category  = CategoriesModel()
                category.categoryId = item.idMeal
                category.title = item.strMeal
                category.imageName = item.strMealThumb
                self.mealsList.append(category)
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
