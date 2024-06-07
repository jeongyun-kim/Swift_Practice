//
//  ViewController.swift
//  StretchyHeaderView
//
//  Created by 김정윤 on 5/27/24.
//

import UIKit

class ViewController: UIViewController {
    private lazy var photoView = View(frame: self.view.frame)
    
    static func instance() -> UIViewController {
        return ViewController(nibName: nil, bundle: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view = photoView
    }


}

