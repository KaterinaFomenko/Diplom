//
//  SearchDataManager.swift
//  Diplom
//
//  Created by Katerina on 08/02/2024.
//

import Foundation

class SearchDataManager {
    weak var searchlVC: SearchVC?
    var mealsArray: [CategoriesModel] = []
    
    func loadData(categoryId: String) {
        ApiManager().getSearchOfMeal(category: categoryId, completion: { [self] (data, error) -> () in
            mealsArray.removeAll()
            for item in data {
                self.mealsArray.append(item.toCategoryModel())
            }
            searchlVC?.updateData()
        })
    }
 
    func getCount() -> Int {
        return mealsArray.count
    }
}
