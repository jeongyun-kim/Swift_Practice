//
//  UIView + Extension.swift
//  TravelTalk
//
//  Created by 김정윤 on 6/2/24.
//

import UIKit

extension UIView {
    func configureChatView() {
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = .systemGray5
        self.layer.cornerRadius = 10
    }
}
