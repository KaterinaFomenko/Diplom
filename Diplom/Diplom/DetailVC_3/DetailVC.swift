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
    
    var mealId = ""
    var detailDataManager = DetailDataManager()
    
    // MARK: - Properties
    
    @IBOutlet weak var mealImageView: UIImageView!
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
    
    @IBAction func youTubeActionButton(_ sender: Any) {
        openYouTubeLink(linkStr: detailDataManager.mealDetail?.strYoutube ?? "")
    }
    
    // MARK: - Life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        configureImageView()
        tableViewIngredients.delegate = self
        tableViewIngredients.dataSource = self
        
        detailDataManager.detailVC = self
        detailDataManager.detailLoadData(idMeal: mealId)
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
        print(detailDataManager.mealDetail?.strMeal)
    }
    
   // MARK: - Private methods

    func configureImageView() {
      //  self.backgroundColor = .white
     //   let groupView: UIView = self.contentView ?? UIView()
        mealImageView.frame.size = CGSize(width: 200, height: 100) //????
        mealImageView.layer.cornerRadius = 8
        mealImageView.layer.masksToBounds = true
        
        mealImageView.layer.shadowColor = UIColor.black.cgColor
        mealImageView.layer.shadowOffset = CGSize(width: 0, height: 4)
        mealImageView.layer.shadowOpacity = 0.4
        mealImageView.layer.shadowRadius = 8
    }
    
    func openYouTubeLink(linkStr: String) {
        if let url = URL(string: linkStr) {
             UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func updateTableHeight() {
        let tableHeight = 44 * detailDataManager.ingredients.count + Int(heightIngredientsTitleLabel.constant) + 10
        heightGroupTableView.constant = CGFloat(tableHeight)
    }
    
    func updateDescriptionHeight() {
        descriptionTextView.text = detailDataManager.mealDetail?.strInstructions
        descriptionTextView.font = UIFont.systemFont(ofSize: 16)
        
        let sizeThatFits = descriptionTextView.sizeThatFits(CGSize(width: descriptionTextView.frame.width, height: CGFloat.greatestFiniteMagnitude))
        
        descriptionTextView.frame.size.height = sizeThatFits.height
        heightGroupDescriptionView.constant = descriptionTextView.frame.size.height
    }
    
    func registerCell() {
        tableViewIngredients.register(DetailTableViewCell.self, forCellReuseIdentifier: "detailTableViewCell")
    }
}

    extension DetailVC: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return detailDataManager.ingredients.count
        }
        
        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailTableViewCell", for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
            
            let row = indexPath.row
            let ingredient = detailDataManager.ingredients[row]
            cell.setData(ingredient: ingredient)
            
            return cell
        }
    }



