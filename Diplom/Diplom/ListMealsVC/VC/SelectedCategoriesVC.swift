//
//  SelectedCategoriesVC.swift
//  Diplom
//
//  Created by Katerina on 25/01/2024.
//

import UIKit


class SelectedCategoriesVC: UICollectionViewController {
    let selectedCategoriesVModel = SelectedCategoriesVModel()
    var cellHeight: CGFloat = 128
    let pad: CGFloat = 40
   // let itemsPerRow: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        configureCollectionView()
    }
    
    func configureCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        
        let cellWidth = collectionView.bounds.width  - pad
        cellHeight = collectionView.bounds.width - pad
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        collectionView.collectionViewLayout = flowLayout
        
        collectionView.showsVerticalScrollIndicator = true
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return selectedCategoriesVModel.getCount()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return selectedCategoriesVModel.getCount()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectCategoriesCell", for: indexPath) as? SelectCategoriesCell else { return UICollectionViewCell() }
        
//        cell.backgroundColor = .white
//        cell.layer.cornerRadius = 8
//        cell.layer.shadowColor = UIColor.black.cgColor
//        cell.layer.shadowOffset = CGSize(width: 0, height: 4)
//        cell.layer.shadowOpacity = 0.4
//        cell.layer.shadowRadius = 8 
//        cell.clipsToBounds = false
        cell.configureUI()
        let row = indexPath.row
        cell.set(model: selectedCategoriesVModel.getCategory(index: row))
        
        return cell
    }
    
    
    
    
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}

extension SelectedCategoriesVC: UICollectionViewDelegateFlowLayout {
 
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


