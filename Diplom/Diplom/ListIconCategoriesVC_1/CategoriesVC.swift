//
//  CategoriesVC.swift
//  Diplom
//
//  Created by Katerina on 27/01/2024.
//

import UIKit

class CategoriesVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let categoriesDataManager = CategoriesDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = true
        registerCell()
    }
    
    func registerCell() {
        tableView.register(ListIconCell.self, forCellReuseIdentifier: "listIconCell")
    }
    
    func openMealVC(indexPath: IndexPath) {
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "selectedCategoriesVC") as? ListMealsVC else { return }
        
        let category = categoriesDataManager.getCategory(index: indexPath.row)
        secondViewController.selectedCategory = category.categoryId
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension CategoriesVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesDataManager.getCount()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listIconCell", for: indexPath) as? ListIconCell else { return UITableViewCell() }
        
        var cellData = categoriesDataManager.getCategory(index: indexPath.row)
      
        cell.setCell(category: cellData)
        
        return cell
    }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            openMealVC(indexPath: indexPath)
    }
}

