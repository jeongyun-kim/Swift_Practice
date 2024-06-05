//
//  UIViewController + Extension.swift
//  NetworkPractice
//
//  Created by 김정윤 on 6/6/24.
//

import UIKit

extension UIViewController {
    func showToast(_ message: String) {
        self.view.makeToast(message, duration: 1, position: .bottom)
    }
    
    func configureUILabel() -> UILabel {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        return label
    }
}

extension UILabel {
    
}
