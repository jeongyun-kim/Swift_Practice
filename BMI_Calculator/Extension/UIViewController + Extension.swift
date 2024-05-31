//
//  UIViewController + Extension.swift
//  BMI_Calculator
//
//  Created by 김정윤 on 5/31/24.
//

import UIKit

extension UIViewController {
    func removeWhitespace(_ text: String) -> String {
        return text.components(separatedBy: " ").joined()
    }
}

