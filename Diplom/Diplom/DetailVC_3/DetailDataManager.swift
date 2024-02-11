//
//  DetailDataManager.swift
//  Diplom
//
//  Created by Katerina on 03/02/2024.
//

import Foundation

class DetailDataManager {
    
    weak var detailVC: DetailVC?
    var mealDetail: MealDetailAPIModel?
    var ingredients: [IngredientModel] = []
    
    func detailLoadData(idMeal: String) {

        ApiManager().getDetailOfMeal(mealId: idMeal, completion: {(dataArray, error) -> () in
            self.mealDetail = dataArray.first
            self.loadIngredients()
            self.detailVC?.update()
        })
    }
    
    func saveToCoreData(meal: CategoriesModel?) {
        guard let meal = meal else { return }
        CoreDataStack.save(meal)
    }
    
    func isInFavoriteList(mealId: String) -> Bool {
        let result = CoreDataStack.isObjectInCoreData(categoryId: mealId)
        return result
    }
    
    func deleteFromCoreData(meal: CategoriesModel?) {
        guard let meal = meal else { return }
        CoreDataStack.delete(meal)
    }
   
    
    func loadIngredients() {
        
        let i1 = IngredientModel(titleName: mealDetail?.strIngredient1, amount: mealDetail?.strMeasure1 )
        ingredients.append(i1)
        let i2 = IngredientModel(titleName: mealDetail?.strIngredient2, amount: mealDetail?.strMeasure2)
        ingredients.append(i2)
        let i3 = IngredientModel(titleName: mealDetail?.strIngredient3, amount: mealDetail?.strMeasure3)
        ingredients.append(i3)
        let i4 = IngredientModel(titleName: mealDetail?.strIngredient4, amount: mealDetail?.strMeasure4)
        ingredients.append(i4)
        let i5 = IngredientModel(titleName: mealDetail?.strIngredient5, amount: mealDetail?.strMeasure5)
        ingredients.append(i5)
        let i6 = IngredientModel(titleName: mealDetail?.strIngredient6, amount: mealDetail?.strMeasure6)
        ingredients.append(i6)
        let i7 = IngredientModel(titleName: mealDetail?.strIngredient7, amount: mealDetail?.strMeasure7)
        ingredients.append(i7)
        let i8 = IngredientModel(titleName: mealDetail?.strIngredient8, amount: mealDetail?.strMeasure8)
        ingredients.append(i8)
        let i9 = IngredientModel(titleName: mealDetail?.strIngredient9, amount: mealDetail?.strMeasure9)
        ingredients.append(i9)
        let i10 = IngredientModel(titleName: mealDetail?.strIngredient10, amount: mealDetail?.strMeasure10)
        ingredients.append(i10)
        let i11 = IngredientModel(titleName: mealDetail?.strIngredient11, amount: mealDetail?.strMeasure11)
        ingredients.append(i11)
        let i12 = IngredientModel(titleName: mealDetail?.strIngredient12, amount: mealDetail?.strMeasure12)
        ingredients.append(i12)
        let i13 = IngredientModel(titleName: mealDetail?.strIngredient13, amount: mealDetail?.strMeasure13)
        ingredients.append(i13)
        let i14 = IngredientModel(titleName: mealDetail?.strIngredient14, amount: mealDetail?.strMeasure14)
        ingredients.append(i14)
        let i15 = IngredientModel(titleName: mealDetail?.strIngredient15, amount: mealDetail?.strMeasure15)
        ingredients.append(i15)
        let i16 = IngredientModel(titleName: mealDetail?.strIngredient16, amount: mealDetail?.strMeasure16)
        ingredients.append(i16)
        let i17 = IngredientModel(titleName: mealDetail?.strIngredient17, amount: mealDetail?.strMeasure17)
        ingredients.append(i17)
        
        let i18 = IngredientModel(titleName: mealDetail?.strIngredient18, amount: mealDetail?.strMeasure18)
        ingredients.append(i18)
        let i19 = IngredientModel(titleName: mealDetail?.strIngredient19, amount: mealDetail?.strMeasure19)
        ingredients.append(i19)
        let i20 = IngredientModel(titleName: mealDetail?.strIngredient20, amount: mealDetail?.strMeasure20)
        ingredients.append(i20)
        
        ingredients = ingredients.filter { ($0.titleName?.count ?? 0) > 1  }
    }
}
