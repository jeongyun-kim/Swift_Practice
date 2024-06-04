//
//  UIViewController + Extension.swift
//  Codebase_Newflix
//
//  Created by 김정윤 on 6/4/24.
//

import UIKit

extension UIViewController {
    func setupUI(_ title: String) {
        view.backgroundColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.title = title
    }
}
