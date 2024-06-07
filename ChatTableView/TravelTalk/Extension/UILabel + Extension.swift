//
//  UILabel + Extension.swift
//  TravelTalk
//
//  Created by 김정윤 on 6/2/24.
//

import UIKit

extension UILabel {
    func descText(size: CGFloat = 12) {
        self.font = UIFont.systemFont(ofSize: size)
        self.textColor = .lightGray
    }
    
    func configureChatLabel() {
        self.numberOfLines = 0
        self.font = UIFont.systemFont(ofSize: 14)
    }
    
    private func dateFormatted(str: String) -> String {
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "YYYY-MM-dd HH:mm"
        let date = dateFormmater.date(from: str)
        dateFormmater.locale = Locale(identifier: "ko-KR")
        dateFormmater.dateFormat = "HH:mm a"
        let result = dateFormmater.string(from: date!)
        return result
    }
}
