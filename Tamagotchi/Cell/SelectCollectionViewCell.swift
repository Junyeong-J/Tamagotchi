//
//  SelectCollectionViewCell.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/24/24.
//

import UIKit
import SnapKit

class SelectCollectionViewCell: UICollectionViewCell {
    
    var contentViewWidth: CGFloat {
        return contentView.bounds.width
    }
    
    lazy var imageView = TamagotchiImage(profile: "noImage", corner: contentViewWidth / 2, border: 1)
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
    
    func configureHierarchy(){
        contentView.addSubview(imageView)
        contentView.addSubview(nameView)
        contentView.addSubview(nameLabel)
    }
    
    func configureLayout() {
        imageView.snp.makeConstraints { make in
            make.center.equalTo(contentView)
            make.size.equalTo(contentView.snp.width)
        }
        
        nameView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.horizontalEdges.equalTo(imageView)
            make.height.equalTo(22)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.center.equalTo(nameView)
        }
    }
    
    func configureUI() {
        nameView.setViewUI(backgroundColor: .clear, cornerRadius: 3, borderColor: UIColor.darkGray.cgColor, borderWidth: 1)
        nameLabel.setUILabel("", textAlignment: .center, color: .black, backgroundColor: .clear, font: .systemFont(ofSize: 13), cornerRadius: 0, numberLine: 0)
    }
    
    func configureData(tamagotchi: TamagotchiData) {
        imageView.image = UIImage(named: tamagotchi.image)
        nameLabel.text = tamagotchi.name
    }
}
