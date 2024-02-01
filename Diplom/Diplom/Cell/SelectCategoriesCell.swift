//
//  SelectCategoriesCell.swift
//  Diplom
//
//  Created by Katerina on 25/01/2024.
//

import UIKit
import SDWebImage

class SelectCategoriesCell: UICollectionViewCell {
    
    @IBOutlet weak var groupView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var labelBGView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    // MARK: - Initialisations
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }
    
    
        
    override func layoutSubviews() {
            //  super.layoutSubviews()
            
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 8).cgPath
            
    }

    func set(model: CategoriesModel) {
        titleLabel.text = model.title
        imageView.image = UIImage(named: model.imageName)
        labelBGView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }
    
    func setWithWebImage(model: CategoriesModel) {
        titleLabel.text = model.title
        imageView.sd_setImage(with: URL(string: model.imageName), placeholderImage: UIImage(named: "Placeholder"))

        labelBGView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }
    
    func configureUI() {
        self.backgroundColor = .white
        let groupView: UIView = self.contentView ?? UIView()
        groupView.layer.cornerRadius = 8
        groupView.layer.masksToBounds = true
        
        groupView.layer.shadowColor = UIColor.black.cgColor
        groupView.layer.shadowOffset = CGSize(width: 0, height: 4)
        groupView.layer.shadowOpacity = 0.4
        groupView.layer.shadowRadius = 8
       
        //clipsToBounds = false
    }
}
