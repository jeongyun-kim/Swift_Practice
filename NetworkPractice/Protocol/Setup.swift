//
//  Setup.swift
//  NetworkPractice
//
//  Created by 김정윤 on 6/6/24.
//

import UIKit

@objc protocol setup {
    func setupHierarchy()
    func setupConstraints()
    @objc optional func setupUI()
    @objc optional func addTargets()
    @objc optional func setupTableView()
}
