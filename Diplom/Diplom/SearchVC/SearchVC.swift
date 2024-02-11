//
//  SearchVC.swift
//  Diplom
//
//  Created by Katerina on 07/02/2024.
//

import Foundation
import UIKit

class SearchVC: UIViewController, UISearchBarDelegate {
    var mealId = ""
    let searchDataManager = SearchDataManager()
    var cellHeight: CGFloat = 128
    let pad: CGFloat = 40
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchBtn: UIButton!
    
    @IBOutlet weak var collectionViewSearch: UICollectionView!
    
    
    @IBAction func searchBtnAction(_ sender: UIButton) {
        let textSearchBar = searchBar.text ?? ""
        searchDataManager.loadData(categoryId: textSearchBar)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        registerCell()
        searchDataManager.searchlVC = self
        searchBar.placeholder = "Test"
        searchBar.delegate = self
    }
    
    func configureCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        
        let cellWidth = collectionViewSearch.bounds.width - pad
        cellHeight = collectionViewSearch.bounds.width - pad
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        collectionViewSearch.collectionViewLayout = flowLayout
        
        collectionViewSearch.showsVerticalScrollIndicator = true
        collectionViewSearch.delegate = self
        collectionViewSearch.dataSource = self
    }
    
    func registerCell() {
        collectionViewSearch.register(SelectCategoriesCell.self, forCellWithReuseIdentifier: "selectCategoriesCell")
    }
    
    func updateData() {
        DispatchQueue.main.async {
            self.collectionViewSearch.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            if let searchText = searchBar.text {
                searchDataManager.loadData(categoryId: searchText)
                searchBar.resignFirstResponder()
            }
    }
    
}
// MARK: UICollectionViewDataSource

extension SearchVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
 func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
}

 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return searchDataManager.getCount()
}

 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell (withReuseIdentifier: "selectCategoriesCell", for: indexPath) as? SelectCategoriesCell else { return UICollectionViewCell() }
    
    cell.configureUI()
    let row = indexPath.row
    let meal = searchDataManager.getMeal(index: row)
    cell.setWithWebImage(model: meal)
    return cell
}

 func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else { return }
    
            let number = indexPath.row
            let meal = searchDataManager.getMeal(index: number)
            detailVC.currentMealModel = meal
    
    navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
         view.endEditing(true)
    }
        
}
        

    extension SearchVC: UICollectionViewDelegateFlowLayout {
        
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
    
    
    
    
    
    

