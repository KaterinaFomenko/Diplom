//
//  DetailVC.swift
//  Diplom
//
//  Created by Katerina on 02/02/2024.
//

import Foundation
import UIKit
import SnapKit


class DetailVC: UIViewController {
    
    var mealId = ""
    var detailDataManager = DetailDataManager()
    
    // MARK: - Properties
    private var padView = 10
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    private lazy var viewImageButton: UIView = {
        let viewImageButton = UIView()
        
        return viewImageButton
    }()
    
    private lazy var imageMain: UIImageView = {
        var imageMain = UIImageView()
        
        return imageMain
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "youtube"), for: .normal)
        
        return button
    }()
    
    private lazy var viewForTitles: UIView = {
        let viewForTitles = UIView()
        
        return viewForTitles
    }()
    
    private lazy var titleMeal: UILabel = {
        let titleMeal = UILabel()
        textMeal.font = .boldSystemFont(ofSize: 20)
    
        return titleMeal
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fillEqually
        view.spacing = 20
        
        return view
    }()
    
    private lazy var titleArea: UILabel = {
        let titleArea = UILabel()
        textMeal.font = .systemFont(ofSize: 16)
        textMeal.textColor = .systemGray
        
        return titleArea
    }()
    
    private lazy var titleCategory: UILabel = {
        let titleCategory = UILabel()
        textMeal.font = .systemFont(ofSize: 16)
        textMeal.textColor = .systemGray
        
        return titleCategory
    }()
    
    private lazy var titleIngredients: UILabel = {
        let titleIngredients = UILabel()
        titleIngredients.font = .systemFont(ofSize: 18)
        
        return titleIngredients
    }()
    
    private lazy var tableIngredients: UITableView = {
        let tableIngredients = UITableView()
        
        return tableIngredients
    }()
    
//    private lazy var tableCell: UITableViewCell = {
//        let cell = UITableViewCell()
//
//        return cell
//    }()
    
//    private lazy var cellImage: UIImageView = {
//        let cellImage = UIImageView()
//        cellImage.image = UIImage(systemName: "circle.fill")
//
//        return cellImage
//    }()
//
//    private lazy var cellName: UILabel = {
//        let cellName = UILabel()
//
//        return cellName
//    }()
    
    private lazy var textMeal: UITextView = {
        let textMeal = UITextView()
        
        return textMeal
    }()
    
    // MARK: - Life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setupUI()
        registerCell()
        detailDataManager.detailVC = self
        detailDataManager.detailLoadData(idMeal: mealId)
        
    }
    
    func update() {
        print("update Detail")
        
        print(detailDataManager.mealDetail?.strMeal)
        
    }
    
   // MARK: - Private methods
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(viewImageButton)
        scrollView.addSubview(viewForTitles)
        scrollView.addSubview(titleIngredients)
        scrollView.addSubview(tableIngredients)
        scrollView.addSubview(textMeal)
        
        viewImageButton.addSubview(imageMain)
        viewImageButton.addSubview(button)
        
        viewForTitles.addSubview(titleMeal)
        
        viewForTitles.addSubview(stackView)
        stackView.addSubview(titleArea)
        stackView.addSubview(titleCategory)
        
        //setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        viewImageButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalTo(padView)
        }
        
        imageMain.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        viewForTitles.snp.makeConstraints { make in
            make.top.equalTo(viewImageButton.snp.bottom).inset(padView)
            make.trailing.leading.equalTo(padView)
        }
        
        titleIngredients.snp.makeConstraints { make in
            make.top.equalTo(viewForTitles.snp.bottom).inset(padView)
            make.trailing.leading.equalTo(padView)
        }
        
        tableIngredients.snp.makeConstraints { make in
            make.top.equalTo(titleIngredients.snp.bottom).inset(padView)
            make.trailing.leading.equalTo(padView)
            
        }
        
        textMeal.snp.makeConstraints { make in
            make.top.equalTo(tableIngredients.snp.bottom).inset(padView)
            make.trailing.leading.equalTo(padView)
            make.bottom.equalTo(scrollView).inset(padView)
        }
    }
    
    func registerCell() {
        tableIngredients.register(DetailTableViewCell.self, forCellReuseIdentifier: "detailTableViewCell")
    }
}
    extension DetailVC: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5
            //return categoriesViewModel.getCount()
        }
        
        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailTableViewCell", for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
            
      //      var cellData = categoriesViewModel.getCategory(index: indexPath.row)
      //      cellData.imageName = "icon-" +  cellData.categoryId.lowercased()
      //      print(cellData.imageName)
       //     cell.setCell(category: cellData)
            
            return cell
        }
    }

    

