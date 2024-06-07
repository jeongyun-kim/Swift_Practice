//
//  ReusableIdentifier.swift
//  TableView0524
//
//  Created by 김정윤 on 5/31/24.
//

import UIKit

protocol identifier {
    static var identifier: String { get }
}

extension UIViewController: identifier {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: identifier {
    static var identifier: String {
        return String(describing: self)
    }
}
