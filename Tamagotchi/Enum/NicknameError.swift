//
//  NicknameError.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/23/24.
//

import Foundation

enum NicknameError: Error {
    case count
    
    var requestError: String {
        switch self {
        case .count:
            return "2글자 이상 6글자 이하로 작성해주세요."
        }
    }
}
