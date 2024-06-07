//
//  UIButton + Extension.swift
//  BMI_Calculator
//
//  Created by 김정윤 on 5/31/24.
//

import UIKit

extension UIButton {
    func configureBtn(_ title: String, size: CGFloat, color: UIColor) {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: size)
        self.tintColor = color
    }
}
