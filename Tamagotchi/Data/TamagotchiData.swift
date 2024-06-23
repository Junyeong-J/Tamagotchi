//
//  TamagotchiData.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/24/24.
//

import Foundation

enum TamagotchiData: CaseIterable {
    
    case cactus, sun, star, prepare
    
    var name: String {
        switch self {
        case .cactus:
            return "따끔따끔 다마고치"
        case .sun:
            return "방실방실 다마고치"
        case .star:
            return "반짝반짝 다마고치"
        case .prepare:
            return "준비중이에요"
        }
    }
    
    var image: String {
        switch self {
        case .cactus:
            return "1-6"
        case .sun:
            return "2-6"
        case .star:
            return "3-6"
        case .prepare:
            return "noImage"
        }
    }
    
}
