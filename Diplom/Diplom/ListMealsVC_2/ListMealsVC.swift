//
//  SelectedCategoriesVC.swift
//  Diplom
//
//  Created by Katerina on 25/01/2024.
//

import UIKit

class ListMealsVC: UICollectionViewController {
    let listMealsDataManager = ListMealsDataManager()
    let CELLPAD: CGFloat = 40
    var selectedCategory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        configureCollectionView()
        listMealsDataManager.listMealsVC = self
        listMealsDataManager.loadData(categoryId: selectedCategory)
    }
    
    private func configureCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        let cellWidth = collectionView.bounds.width - CELLPAD
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth / 2)
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsVerticalScrollIndicator = true
    }
    
    private func registerCell() {
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
        return listMealsDataManager.getCount()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell (withReuseIdentifier: "selectCategoriesCell", for: indexPath) as? SelectCategoriesCell else { return UICollectionViewCell() }
        
        cell.configureUI()
        let meal = listMealsDataManager.mealsArray[indexPath.row]
        cell.setWithWebImage(model: meal)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else { return }
        
        let meal = listMealsDataManager.mealsArray[indexPath.row]
        detailVC.currentMealModel = meal
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ListMealsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CELLPAD / 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CELLPAD / 2
    }
}

