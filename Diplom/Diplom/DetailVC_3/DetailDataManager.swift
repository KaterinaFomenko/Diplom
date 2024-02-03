//
//  DetailDataManager.swift
//  Diplom
//
//  Created by Katerina on 03/02/2024.
//

import Foundation

class DetailDataManager {
    
    weak var detailVC: DetailVC?
    var mealDetail: MealDetail?
    //var ingredients: [Ingredients]?
    
    func detailLoadData(idMeal: String) {

        ApiManager().getDetailOfMeal(mealId: idMeal, completion: {(dataArray, error) -> () in
            self.mealDetail = dataArray.first
            self.detailVC?.update()
        })
    }
    
    
    
    
    
}
