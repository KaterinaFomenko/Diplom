//
//  DetailTableViewCell.swift
//  Diplom
//
//  Created by Katerina on 03/02/2024.
//

import Foundation
import UIKit

class DetailTableViewCell: UITableViewCell {
    let leftRight = 15
    // MARK: - Properties
    
    private lazy var circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "circle.fill")
        imageView.contentMode = .scaleAspectFill
        //imageView.layer.cornerRadius = 12.0
        //imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
     private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Milk"
        label.textAlignment = .left
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 1
        
        return label
    }()
    
     private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.text = "500 ml"
        label.textAlignment = .right
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 1
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(circleImageView)
        addSubview(titleLabel)
        addSubview(amountLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        circleImageView.snp.makeConstraints { make in
            make.height.equalTo(10)
            make.width.equalTo(10)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(leftRight)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(circleImageView.snp.trailing).offset(leftRight)
            make.centerY.equalToSuperview()
        }
        
        amountLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(leftRight)
            make.leading.equalTo(titleLabel.snp.trailing).offset(leftRight)
            make.centerY.equalToSuperview()
        }
    }
    
    func setData(ingredient: IngredientModel) {
        titleLabel.text = ingredient.titleName
        amountLabel.text = ingredient.amount
    }
}
