//
//  setupUI.swift
//  TravelTalk
//
//  Created by 김정윤 on 6/1/24.
//

import UIKit

@objc protocol setupUI {
    func setupNavigation()
    func setupTableView()
    @objc optional func setupSearchController()
}
