//
//  SelectCategoriesCell.swift
//  Diplom
//
//  Created by Katerina on 25/01/2024.
//

import UIKit
import SDWebImage

class SelectCategoriesCell: UICollectionViewCell {
    
  //  @IBOutlet weak var groupView: UIView!
    //@IBOutlet weak var titleLabel: UILabel!
 //   @IBOutlet weak var labelBGView: UIView!
    //@IBOutlet weak var imageView: UIImageView!
    
    private lazy var groupView: UIView = {
        var groupView = UIView()
        
        return groupView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image")
        imageView.contentMode = .scaleAspectFill
        
       // imageView.layer.cornerRadius = 12.0
       // imageView.layer.masksToBounds = false
        
        return imageView
    }()
    
    private lazy var labelBGView: UIView = {
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
        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 22)
        label.numberOfLines = 1
        
        return label
    }()
    
    // MARK: - Initialisations
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
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
    
    func setupUI() {
        addSubview(groupView)
        groupView.addSubview(imageView)
        groupView.addSubview(labelBGView)
        groupView.addSubview(titleLabel)
        
        setupConstraints()
    }
  
    func setupConstraints() {
        groupView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        labelBGView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            //make.centerY.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
}
