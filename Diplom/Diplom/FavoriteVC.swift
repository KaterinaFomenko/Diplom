//
//  FavoriteVC.swift
//  Diplom
//
//  Created by Katerina on 10/02/2024.
//

import Foundation
import UIKit

class FavoriteVC: UIViewController {
    var cellHeight: CGFloat = 128
    let CELLPAD: CGFloat = 40

    var favoriteDataManager = FavoriteDataManager()
    
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        
        favoriteDataManager.favoriteVC = self
        configureCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        favoriteDataManager.getFetchAll()
        updateData()
    }
    
    func updateData() {
        favoriteCollectionView.reloadData()
    }
    
    private func registerCell() {
        favoriteCollectionView.register(SelectCategoriesCell.self, forCellWithReuseIdentifier: "selectCategoriesCell")
    }
    
    private func configureCollectionView() {
        favoriteCollectionView.delegate = self
        favoriteCollectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        
        let cellWidth = favoriteCollectionView.bounds.width - CELLPAD
        cellHeight = favoriteCollectionView.bounds.width - CELLPAD
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        favoriteCollectionView.collectionViewLayout = flowLayout
        
        favoriteCollectionView.showsVerticalScrollIndicator = true
    }
}

// MARK: UICollectionViewDataSource
extension FavoriteVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteDataManager.getCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell (withReuseIdentifier: "selectCategoriesCell", for: indexPath) as? SelectCategoriesCell else { return UICollectionViewCell() }
        
        cell.configureUI()
        let meal = favoriteDataManager.allFavoritesRecipes[indexPath.row]
        cell.setWithWebImage(model: meal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else { return }
        
        let meal = favoriteDataManager.allFavoritesRecipes[indexPath.row]
        detailVC.currentMealModel = meal
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension FavoriteVC: UICollectionViewDelegateFlowLayout {
    
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
