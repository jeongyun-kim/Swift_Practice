//
//  UIStruct.swift
//  NetworkPractice
//
//  Created by 김정윤 on 6/6/24.
//

import UIKit

struct Font {
    static let descFont = UIFont.systemFont(ofSize: 14)
    static let boldTitleFont = UIFont.systemFont(ofSize: 18, weight: .bold)
    static let regularTitleFont = UIFont.systemFont(ofSize: 18, weight: .regular)
}

struct Layer {
    static let cornerRadius: CGFloat = 6
}

struct Axis {
    static let horizontalAxis: NSLayoutConstraint.Axis = .horizontal
}
