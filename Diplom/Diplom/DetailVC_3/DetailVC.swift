//
//  DetailVC.swift
//  Diplom
//
//  Created by Katerina on 02/02/2024.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

class DetailVC: UIViewController {
    var currentMealModel: CategoriesModel?
    var detailDataManager = DetailDataManager()
    var isInFavoriteList = false
  
    // MARK: - Properties
    @IBOutlet weak var mealImageView: UIImageView!
  
  //  @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var youTubeButton: UIButton!
    @IBOutlet weak var mealTitleLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
   
    @IBOutlet weak var ingredientsTitleLabel: UILabel!
    @IBOutlet weak var tableViewIngredients: UITableView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var groupTableView: UIView!
    @IBOutlet weak var groupDescriptionView: UIView!
    
    @IBOutlet weak var heightGroupTableView: NSLayoutConstraint!
    @IBOutlet weak var heightGroupDescriptionView: NSLayoutConstraint!
    @IBOutlet weak var heightIngredientsTitleLabel: NSLayoutConstraint!
    
    @IBAction func favoriteActionButton(_ sender: UIButton) {
        sender.setImage(UIImage(named: "favorite_red"), for: .normal)
        CoreDataStack.save(CategoriesModel())
    }
    
    @IBAction func youTubeActionButton(_ sender: Any) {
        openYouTubeLink(linkStr: detailDataManager.mealDetail?.strYoutube ?? "")
    }
    
    // MARK: - Life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        configureImageView()
        addFavoriteNavButton()
        checkIsInFavoriteList()
        
        tableViewIngredients.delegate = self
        tableViewIngredients.dataSource = self
        
        detailDataManager.detailVC = self
        detailDataManager.detailLoadData(idMeal: currentMealModel?.categoryId ?? "")
    }
    
    func update() {
        print("update Detail")
        DispatchQueue.main.async {
            self.tableViewIngredients.reloadData()
            
            let imageURLStr = self.detailDataManager.mealDetail?.strMealThumb ?? ""
            self.mealImageView.sd_setImage(with: URL(string: imageURLStr), placeholderImage: UIImage(named: "Placeholder"))
            
            self.mealTitleLabel.text = self.detailDataManager.mealDetail?.strMeal
            
            self.areaLabel.text = self.detailDataManager.mealDetail?.strArea
            
            self.categoryLabel.text = self.detailDataManager.mealDetail?.strCategory
            
            self.descriptionTextView.text = self.detailDataManager.mealDetail?.strInstructions
            
            self.updateTableHeight()
            self.updateDescriptionHeight()
            
        }
        print(detailDataManager.mealDetail?.strMeal ?? "")
    }
    
   // MARK: - Private methods

    func configureImageView() {
        mealImageView.layer.cornerRadius = 12
        mealImageView.layer.masksToBounds = true
    }
    
    func openYouTubeLink(linkStr: String) {
        if let url = URL(string: linkStr) {
             UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func addFavoriteNavButton() {
        let image = UIImage(named: "favorite")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image,
                                                                 style:.plain,
                                                                 target: self,
                                                                 action: #selector(self.favoriteAction))
    }
    
    func checkIsInFavoriteList() {
        isInFavoriteList = detailDataManager.isInFavoriteList(mealId: currentMealModel?.categoryId ?? "")
        if isInFavoriteList {
            let image = UIImage(named: "favorite_red")
            self.navigationItem.rightBarButtonItem?.image = image
        }
    }
    
    @objc func favoriteAction() {
        if isInFavoriteList {
            //remove from CoreData
            detailDataManager.deleteFromCoreData(meal: currentMealModel)
            isInFavoriteList = false
            let image = UIImage(named: "favorite")
            self.navigationItem.rightBarButtonItem?.image = image
    
        } else {
            //add CoreData
            let image = UIImage(named: "favorite_red")
            self.navigationItem.rightBarButtonItem?.image = image
            let isInFavorite = detailDataManager.isInFavoriteList(mealId: currentMealModel?.categoryId ?? "")
            if !isInFavorite {
                detailDataManager.saveToCoreData(meal: currentMealModel)
                isInFavoriteList = true
            }
        }
    }
    
    func updateTableHeight() {
        let tableHeight = 44 * detailDataManager.ingredients.count + Int(heightIngredientsTitleLabel.constant) + 10
        heightGroupTableView.constant = CGFloat(tableHeight)
    }
    
    func updateDescriptionHeight() {
        descriptionTextView.text = detailDataManager.mealDetail?.strInstructions
        descriptionTextView.font = UIFont.systemFont(ofSize: 17)
        
        let sizeThatFits = descriptionTextView.sizeThatFits(CGSize(width: descriptionTextView.frame.width, height: CGFloat.greatestFiniteMagnitude))
        
        descriptionTextView.frame.size.height = sizeThatFits.height
       //Корректировка для отображения одной строки
        if descriptionTextView.frame.size.height < 40 {
            heightGroupDescriptionView.constant = 70
        } else {
            heightGroupDescriptionView.constant = descriptionTextView.frame.size.height
        }
    }
    
    func registerCell() {
        tableViewIngredients.register(DetailTableViewCell.self, forCellReuseIdentifier: "detailTableViewCell")
    }
}

    extension DetailVC: UITableViewDelegate, UITableViewDataSource {
        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return detailDataManager.ingredients.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailTableViewCell", for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
            
            let ingredient = detailDataManager.ingredients[indexPath.row]
            cell.setData(ingredient: ingredient)
            
            return cell
        }
    }



