//
//  ListIconCell.swift
//  Diplom
//
//  Created by Katerina on 27/01/2024.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

class ListIconCell: UITableViewCell {
    let baseImageUrl = "https://www.themealdb.com/images/category/"
    
    private lazy var imageViewLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image")
        imageView.contentMode = .scaleAspectFill
        
       // imageView.layer.cornerRadius = 12.0
       // imageView.layer.masksToBounds = false
        
        return imageView
    }()
    
    private lazy var grayRec: UIView = {
        let titleFrame = UIView()
        titleFrame.backgroundColor = .systemGray6
        
        titleFrame.layer.cornerRadius = 8.0
        titleFrame.layer.masksToBounds = false
        
        titleFrame.layer.shadowColor = UIColor.lightGray.cgColor
        titleFrame.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        titleFrame.layer.shadowRadius = 1
        titleFrame.layer.shadowOpacity = 0.2
        
        return titleFrame
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title recipe"
        label.textAlignment = .left
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: 22)
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
    
    override func layoutSubviews() {
        grayRec.layer.shadowPath = UIBezierPath(roundedRect: grayRec.bounds, cornerRadius: 12).cgPath
    }
    
    func setupUI() {
        addSubview(grayRec)
        grayRec.addSubview(imageViewLogo)
        grayRec.addSubview(titleLabel)
        
        setupConstraints()
    }
    
    func setCell(category: CategoriesModel) {
        imageViewLogo.image = UIImage(named: category.imageName)
        titleLabel.text = category.title
    }
    
    func setCellWithWebImage(category: CategoriesModel) {
        let urlStr = baseImageUrl + category.categoryId.lowercased() + ".png"
        imageViewLogo.sd_setImage(with: URL(string: urlStr ), placeholderImage: UIImage(named: "Placeholder"))
        
        titleLabel.text = category.title
    }
    
    private func setupConstraints() {
        grayRec.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(8)
        }
        
        imageViewLogo.snp.makeConstraints { make in
            make.height.equalToSuperview().offset(-20)
            make.width.equalTo(40)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.leading.equalTo(imageViewLogo.snp.trailing).offset(20)
            make.centerY.equalToSuperview()
        }
    }
}
