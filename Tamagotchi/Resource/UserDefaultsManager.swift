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
    let user = "isUser"
    let tamagotchiNameForKey = "tamagotchiName"
    let tamagotchiImageForKey = "tamagotchiImage"
    
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
    
    var isUser: Bool {
        get {
            UserDefaults.standard.bool(forKey: user)
        }
        
        set {
            UserDefaults.standard.set(true, forKey: user)
        }
        
    }
    
    var tamagotchiName: String {
        get {
            UserDefaults.standard.string(forKey: tamagotchiNameForKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: tamagotchiNameForKey)
        }
    }
    
    var tamagotchiImage: String {
        get {
            UserDefaults.standard.string(forKey: tamagotchiImageForKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: tamagotchiImageForKey)
        }
    }
    
}
