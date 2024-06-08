//
//  UIView+Extension.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/8/24.
//

import UIKit

extension UIView {
    
    func setViewUI(backgroundColor: UIColor, cornerRadius: Double, borderColor: CGColor, borderWidth: Double) {
        
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    }
    
    
}
