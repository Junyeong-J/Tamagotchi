//
//  UserDefaultsManager.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/23/24.
//

import UIKit

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    private init() {}
    
    let nicknameForKey = "nickname"
    
    var nickname: String? {
        get {
            guard let nickname = UserDefaults.standard.string(forKey: nicknameForKey) else {
                return nil
            }
            return nickname
        }
        set {
            UserDefaults.standard.set(newValue, forKey: nicknameForKey)
        }
    }
    
}
