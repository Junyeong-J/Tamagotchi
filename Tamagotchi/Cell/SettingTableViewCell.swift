//
//  SettingTableViewCell.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/12/24.
//

import UIKit
import SnapKit

class SettingTableViewCell: UITableViewCell {

    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let nicknameLabel = UILabel()
    let nextImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(nextImageView)
        contentView.addSubview(nicknameLabel)
    }
    
    func configureLayout() {
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView).inset(20)
            make.size.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(10)
            make.centerY.equalTo(contentView)
            make.width.equalTo(200)
        }
        
        nextImageView.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.trailing.equalTo(contentView).inset(20)
            make.centerY.equalTo(contentView)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.trailing.equalTo(nextImageView.snp.leading).offset(-10)
            make.centerY.equalTo(contentView)
            make.width.equalTo(100)
        }
        
    }
    
    func configureUI() {
        
        
        
        nextImageView.image = UIImage(systemName: "chevron.right")
        
        nicknameLabel.text = "고래밥"
        nicknameLabel.textAlignment = .right
        
    }
    
    func configureSet(icon: String , title: String) {
        iconImageView.image = UIImage(systemName: icon)
        titleLabel.text = title
    }
    
}
