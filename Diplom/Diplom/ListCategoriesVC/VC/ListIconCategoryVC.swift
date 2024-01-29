//
//  ListIconCategoryVC.swift
//  Diplom
//
//  Created by Katerina on 27/01/2024.
//

import UIKit

class ListIconCategoryVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let categoriesViewModel = SelectedCategoriesVModel()
    
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
}

extension ListIconCategoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesViewModel.getCount()
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listIconCell", for: indexPath) as? ListIconCell else { return UITableViewCell() }
        
        var cellData = categoriesViewModel.getCategory(index: indexPath.row)
        cellData.imageName = "icon-" +  cellData.categoryId.lowercased()
        print(cellData.imageName)
        cell.setCell(category: cellData)
        
        return cell
    }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("tap cell number \(indexPath.row).")
            guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "selectedCategoriesVC") as? SelectedCategoriesVC else { return }
            self.navigationController?.pushViewController(secondViewController, animated: true)
            
 
        
    }
}

