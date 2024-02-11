//
//  FavoriteDataManager.swift
//  Diplom
//
//  Created by Katerina on 10/02/2024.
//

import Foundation

class FavoriteDataManager {
    weak var favoriteVC: FavoriteVC?
    var allFavoritesRecipes: [CategoriesModel] = []
    
    func getCount() -> Int {
        return allFavoritesRecipes.count
    }
    
    func getMeal(index: Int) -> CategoriesModel {
        return allFavoritesRecipes[index]
    }
    
    func getFetchAll() {
       let arrayAllFav = CoreDataStack.fetchAll()
   
        allFavoritesRecipes.removeAll()
        for i in arrayAllFav {
            let categoriesModel = CategoriesModel(categoryId: i.categoryId ?? "", title: i.title ?? "", imageName: i.imageName ?? "")
            allFavoritesRecipes.append(categoriesModel)
        }
        favoriteVC?.updateData()
    }
    
    
}
