//
//  MainTableViewCell.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/8/24.
//

import UIKit
import SnapKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    let deviceWidth = UIScreen.main.bounds.size.width
    
    let imageView = UIImageView()
    let nameView = UIView()
    let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameView)
        nameView.addSubview(nameLabel)
    }
    
    func configureLayout() {
        imageView.snp.makeConstraints { make in
            make.size.equalTo(((deviceWidth - 80) / 3) - 10)
            make.centerX.equalTo(contentView)
            make.centerY.equalTo(contentView).inset(-5)
        }
        
        nameView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(3)
            make.leading.trailing.equalTo(imageView)
            make.bottom.equalTo(contentView).inset(3)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.center.equalTo(nameView)
        }
    }
    
    func configureUI() {
        
        imageView.setImageViewUI(contentMode: .scaleAspectFill, cornerRadius: (((deviceWidth - 80) / 3) - 10)/2)
        nameView.setViewUI(backgroundColor: .clear, cornerRadius: 3, borderColor: UIColor.darkGray.cgColor, borderWidth: 1)
        nameLabel.setUILabel("", textAlignment: .center, color: .black, backgroundColor: .clear, font: .systemFont(ofSize: 13), cornerRadius: 0, numberLine: 0)
    }
    
    func configureData(data: [String:String]) {
        if let key = data.keys.first, let imageName = data[key] {
            nameLabel.text = key
            imageView.image = UIImage(named: imageName)
        }
        
    }
    
}
