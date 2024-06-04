//
//  UITextField + Extension.swift
//  Codebase_Newflix
//
//  Created by 김정윤 on 6/4/24.
//

import UIKit

extension UITextField {
    func configureSignupTextField() {
        self.backgroundColor = .darkGray
        self.textColor = .white
        self.textAlignment = .center
        self.layer.cornerRadius = 6
        self.font = UIFont.systemFont(ofSize: 14)
    }
}
