//
//  UIView + Extension.swift
//  BMI_Calculator
//
//  Created by 김정윤 on 5/31/24.
//

import UIKit

extension UIView {
    func configureUIView(cornerRadius: CGFloat? = 18) {
        self.layer.cornerRadius = cornerRadius!
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1.5
    }
}
