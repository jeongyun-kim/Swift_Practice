//
//  ReusableIdentifier.swift
//  Network_0605
//
//  Created by 김정윤 on 6/5/24.
//

import UIKit

protocol ReusableIdentifier {
    static var identifier: String { get }
}

extension UITableViewCell: ReusableIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}
