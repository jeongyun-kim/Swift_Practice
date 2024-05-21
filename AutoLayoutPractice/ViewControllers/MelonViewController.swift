//
//  MelonViewController.swift
//  AutoLayoutPractice
//
//  Created by 김정윤 on 5/21/24.
//

import UIKit

class MelonViewController: UIViewController {

    @IBOutlet var instagramBtn: UIButton!
    @IBOutlet var recommendBtn: UIButton!
    @IBOutlet var likeBtn: UIButton!
    @IBOutlet var moreBtn: UIButton!
    @IBOutlet var dismissBtn: UIButton!
    @IBOutlet var musicImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        moreBtn.transform = CGAffineTransform(rotationAngle: .pi * 0.5)
        dismissBtn.transform = CGAffineTransform(rotationAngle: .pi * 0.5)
        
        recommendBtn.setTitle("유사곡", for: .normal)
        //recommendBtn.invalidateIntrinsicContentSize()
        recommendBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        recommendBtn.tintColor = .gray
        recommendBtn.layer.borderColor = UIColor.gray.cgColor
        recommendBtn.layer.borderWidth = 1
        recommendBtn.layer.cornerRadius = 5
        
        instagramBtn.tintColor = .gray
    }
}
