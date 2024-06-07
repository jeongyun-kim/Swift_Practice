//
//  UILabel + Extension.swift
//  Codebase_LottoAPI
//
//  Created by 김정윤 on 6/5/24.
//

import UIKit

extension UILabel {
    func configureBall() {
        self.backgroundColor = .systemYellow
        self.textAlignment = .center
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        self.textColor = .white
        self.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    }
}
