//
//  identifier.swift
//  TravelTalk
//
//  Created by 김정윤 on 6/1/24.
//

import UIKit

protocol reusableIdentifier {
    static var identifier: String { get }
}


extension UIViewController: reusableIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: reusableIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}
