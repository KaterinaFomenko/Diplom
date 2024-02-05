//
//  MealListAPIModel.swift
//  Diplom
//
//  Created by Katerina on 03/02/2024.
//

struct MealListAPIModel: Decodable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
    func toCategoryModel() -> CategoriesModel {
        let categoriesModel = CategoriesModel()
        categoriesModel.categoryId = idMeal
        categoriesModel.imageName = strMealThumb
        categoriesModel.title = strMeal
        return categoriesModel
    }
}

