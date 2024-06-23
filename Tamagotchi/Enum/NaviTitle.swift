//
//  NaviTitle.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/23/24.
//

import Foundation

enum NaviTitle: String {
    
    case nick
    
    var nickTitle: String {
        if let nickname = UserDefaultsManager.shared.nickname {
            return "\(nickname)님 이름 정하기"
        } else {
            return ""
        }
    }
}
