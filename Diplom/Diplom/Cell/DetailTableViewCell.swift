//
//  DetailTableViewCell.swift
//  Diplom
//
//  Created by Katerina on 03/02/2024.
//

import Foundation
import UIKit

class DetailTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private var padView = 10
    private var heightCell = 20
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fillEqually
        view.spacing = 20
        
        return view
    }()
    
    private lazy var cellImage: UIImageView = {
        let cellImage = UIImageView()
        cellImage.image = UIImage(systemName: "circle.fill")
        
        return cellImage
    }()
    
    private lazy var cellName: UILabel = {
        let cellName = UILabel()
        
        return cellName
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(stackView)
        stackView.addSubview(cellImage)
        stackView.addSubview(cellName)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        cellImage.snp.makeConstraints { make in
            make.height.equalTo(heightCell)
            make.centerY.equalToSuperview()
            make.leading.equalTo(padView)
        }
        
        cellName.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(cellImage.snp.leading).inset(padView)
            make.leading.equalTo(padView)
        }
        
    }
    
}
