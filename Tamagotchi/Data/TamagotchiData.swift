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
    
    var setImage: String {
        switch self {
        case .cactus:
            return "1-1"
        case .sun:
            return "2-1"
        case .star:
            return "3-1"
        case .prepare:
            return "noImage"
        }
    }
    
    var explain: String {
        switch self {
        case .cactus:
            return "저는 \(name)입니당 키는 2cm\n몸무게는 150g이에용\n성격은 소심하지만 마음은 따듯해요.\n열심히 잘먹고 잘 클 자신은 있답니당\n 반가워요 주인님!"
        case .sun:
            return "저는 \(name)입니당 키는 100km\n몸무게는 150톤이에용\n성격은 화끈하고 날라다닙니당~!\n열심히 잘먹고 잘 클 자신은\n있답니당 방실방실!"
        case .star:
            return "저는 \(name)입니당 키는 100m\n몸무게는 1톤이에용\n성격은 차갑고 남들에겐 빛이 납니당~!\n열심히 잘먹고 잘 클 자신은 있답니당\n 반짝반짝!"
        case .prepare:
            return ""
        }
    }
    
}
