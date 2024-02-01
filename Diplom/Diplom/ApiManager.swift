//
//  ApiManager.swift
//  Diplom
//
//  Created by Katerina on 30/01/2024.
//

import Foundation
import UIKit

struct MealAPIModel: Decodable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
}

struct MealAPIRoot: Decodable {
    let meals: [MealAPIModel]
}

class ApiManager {
    let strBaseApiFilter = "https://www.themealdb.com/api/json/v1/1/filter.php?c="
    
    func getListOfMeal(category: String, complition: @escaping(_ data: [MealAPIModel],_ error: String)->()) {
        
        guard let url = URL(string: strBaseApiFilter + category) else { return }
        var request = URLRequest(url: url)
        request.setValue( "application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                //print("Данные::: \(data)")
                if let meals = try? JSONDecoder().decode(MealAPIRoot.self, from: data) {
                    //print("БЛЮДА::: \(meals)")
                    complition(meals.meals, "")
                } else {
                    //print("Invalid Response")
                    complition([], "Invalid Response")
                }
            } else if let error = error {
                //print("HTTP Request Failed \(error)")
                complition([], "HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }
}

extension String {
    func toUIImage() {
        
    }
}
    
    

