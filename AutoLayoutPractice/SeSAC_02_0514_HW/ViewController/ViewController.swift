//
//  ViewController.swift
//  SeSAC_02_0514_HW
//
//  Created by 김정윤 on 5/14/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var thumbnailImageView3: UIImageView!
    @IBOutlet weak var thumbnailImageView2: UIImageView!
    @IBOutlet weak var thumbnailImageView1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        setupThumbnail(imageView: thumbnailImageView1)
        setupThumbnail(imageView: thumbnailImageView2)
        setupThumbnail(imageView: thumbnailImageView3)
    }

    func setupThumbnail(imageView: UIImageView) {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 60
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.gray.cgColor
    }
}

