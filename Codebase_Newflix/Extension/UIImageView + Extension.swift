//
//  UIImageView + Extension.swift
//  Codebase_Newflix
//
//  Created by 김정윤 on 6/4/24.
//

import UIKit

extension UIImageView {
    func configureImageView(_ imageName: String) {
        self.layer.cornerRadius = 10
        self.image = UIImage(named: imageName)
        self.contentMode = .scaleAspectFill
        self.layer.masksToBounds = true
    }
}
