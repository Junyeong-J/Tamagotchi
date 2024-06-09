//
//  SelectPushViewProtocol.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/9/24.
//

import UIKit

protocol FirstTableViewCellDelegate: AnyObject {
    func didSelectView(data: [String: String])
}
