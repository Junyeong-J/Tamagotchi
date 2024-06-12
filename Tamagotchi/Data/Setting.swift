//
//  Setting.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/12/24.
//

import UIKit

enum Setting: CaseIterable {
    
    case nickname, tamagochi, reset
    
    var icon: String {
        switch self {
        case .nickname:
            return "pencil"
        case .tamagochi:
            return "moon.fill"
        case .reset:
            return "arrow.clockwise"
        }
    }
    
    var title: String {
        switch self {
        case .nickname:
            return "내 이름 설정하기"
        case .tamagochi:
            return "다마고치 변경하기"
        case .reset:
            return "데이터 초기화"
        }
    }
    
}
