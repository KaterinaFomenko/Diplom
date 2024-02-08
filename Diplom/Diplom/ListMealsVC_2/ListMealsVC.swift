//
//  SelectedCategoriesVC.swift
//  Diplom
//
//  Created by Katerina on 25/01/2024.
//

import UIKit

class ListMealsVC: UICollectionViewController {
    let listMealsViewModel = ListMealsViewModel()
    var cellHeight: CGFloat = 128
    let pad: CGFloat = 40
    var selectedCategory = ""
    // let itemsPerRow: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        configureCollectionView()
        listMealsViewModel.listMealsVC = self
        listMealsViewModel.loadData(categoryId: selectedCategory)
    }
    
    func configureCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        
        let cellWidth = collectionView.bounds.width - pad
        cellHeight = collectionView.bounds.width - pad
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        collectionView.collectionViewLayout = flowLayout
        
        collectionView.showsVerticalScrollIndicator = true
    }
    
    func registerCell() {
        collectionView.register(SelectCategoriesCell.self, forCellWithReuseIdentifier: "selectCategoriesCell")
    }
    
    func updateData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listMealsViewModel.getCount()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell (withReuseIdentifier: "selectCategoriesCell", for: indexPath) as? SelectCategoriesCell else { return UICollectionViewCell() }
        
        cell.configureUI()
        let row = indexPath.row
        let meal = listMealsViewModel.getMeal(index: row)
        cell.setWithWebImage(model: meal)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else { return }
        
                let number = indexPath.row
                let meal = listMealsViewModel.getMeal(index: number)
                let meal2 = listMealsViewModel.mealsArray[number]
                let id = meal.categoryId
                detailVC.mealId = id
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ListMealsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return pad / 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return pad / 2
    }
}

//        cell.backgroundColor = .white
//        cell.layer.cornerRadius = 8
//        cell.layer.shadowColor = UIColor.black.cgColor
//        cell.layer.shadowOffset = CGSize(width: 0, height: 4)
//        cell.layer.shadowOpacity = 0.4
//        cell.layer.shadowRadius = 8
//        cell.clipsToBounds = false
