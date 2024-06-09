//
//  UIButton+Extension.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/9/24.
//

import UIKit

extension UIButton {
    
    func setButtonUI(title: String, font: UIFont, titleColor: UIColor, backgroundColor: UIColor, cornerRadius: Double, borderWidth: Double, borderColor: CGColor, tagNum: Int){
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.tag = tagNum
    }
    
    func setButtonCorners(setCorners: CACornerMask) {
        self.layer.maskedCorners = setCorners
    }
}
