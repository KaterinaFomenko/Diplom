//
//  ApiManager.swift
//  Diplom
//
//  Created by Katerina on 30/01/2024.
//

import Foundation
import UIKit

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

struct MealListAPIRoot: Decodable {
    let meals: [MealListAPIModel]
}

class ApiManager {
    let baseUrlStr = "https://www.themealdb.com/api/json/v1/1/"
    let apiFilterStr = "filter.php?c="
    let apiDetailStr = "lookup.php?i="
    
    func getListOfMeal(category: String, completion: @escaping(_ data: [MealListAPIModel],_ error: String)->()) {
        
        guard let url = URL(string: baseUrlStr + apiFilterStr + category) else { return }
        var request = URLRequest(url: url)
        request.setValue( "application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                //print("Данные::: \(data)")
                if let meals = try? JSONDecoder().decode(MealListAPIRoot.self, from: data) {
                    print("БЛЮДА::: \(meals)")
                    completion(meals.meals, "")
                } else {
                    completion([], "Invalid Response")
                }
            } else if let error = error {
                completion([], "HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }
    
    func getDetailOfMeal(mealId: String, completion: @escaping(_ dataArray: [MealDetail],_ error: String)->()) {
        
        guard let url = URL(string: baseUrlStr + apiDetailStr + mealId) else { return }
        
        var request = URLRequest(url: url)
      //  request.setValue( "application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                //print("Данные::: \(data)")
                if let meals = try? JSONDecoder().decode(RootMealDetailAPI.self, from: data) {
                    print("БЛЮДА::: \(meals)")
                    completion(meals.meals, "")
                } else {
                    completion([], "Invalid Response")
                }
            } else if let error = error {
                completion([], "HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }
}


    
    

