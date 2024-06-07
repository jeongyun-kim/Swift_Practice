//
//  UIImageView + Extension.swift
//  TravelTalk
//
//  Created by 김정윤 on 6/2/24.
//

import UIKit

extension UIImageView {
    func configureProfileImageView() {
        self.layer.cornerRadius = self.frame.height / 2
        self.contentMode = .scaleAspectFill
        self.image = UIImage(named: "커비")
    }
}
