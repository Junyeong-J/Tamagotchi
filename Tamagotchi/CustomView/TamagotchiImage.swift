//
//  TamagotchiImage.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/24/24.
//

import UIKit

class TamagotchiImage: UIImageView {
    
    init(profile: String, corner: Double, border: Double) {
        super.init(frame: .zero)
        
        image = UIImage(named: profile)
        contentMode = .scaleAspectFit
        layer.cornerRadius = corner
        layer.borderWidth = border
        layer.borderColor = UIColor.darkGray.cgColor
        clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
