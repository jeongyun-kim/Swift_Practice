//
//  UILabel + Extension.swift
//  NetworkPractice
//
//  Created by 김정윤 on 6/6/24.
//

import UIKit

extension UILabel {
    func configureLottoLabel() {
        self.text = "1"
        self.backgroundColor = .lightGray
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        self.textColor = .white
    }
}

