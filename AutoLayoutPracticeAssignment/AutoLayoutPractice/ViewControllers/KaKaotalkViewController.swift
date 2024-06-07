//
//  ViewController.swift
//  AutoLayoutPractice
//
//  Created by 김정윤 on 5/20/24.
//

import UIKit

class KaKaotalkViewController: UIViewController {
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var profileNameLabel: UILabel!
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet var labels: [UILabel]!
    
    let imageNames: [String] = ["xmark", "gift.circle", "circle.grid.3x3.circle", "gearshape.circle", "message.fill", "pencil", "quote.closing"]
    let labelTexts: [String] = ["나와의 채팅", "프로필 편집", "카카오스토리"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        backgroundImageView.image = UIImage(named: "kakaotalk_background")
        backgroundImageView.contentMode = .scaleAspectFill
        
        for i in (0..<buttons.count) {
            let btn = buttons[i]
            btn.setTitle("", for: .normal)
            btn.setImage(UIImage(systemName: imageNames[i]), for: .normal)
            btn.tintColor = .white
        }
        
        for i in (0..<imageViews.count) {
            let imageView = imageViews[i]
            let title = labels[i]
            imageView.image = UIImage(systemName: imageNames[i+4])
            imageView.tintColor = .white
            imageView.contentMode = .scaleAspectFit
            title.text = labelTexts[i]
            title.textAlignment = .center
            title.textColor = .white
            title.font = UIFont.systemFont(ofSize: 12)
        }
        profileImageView.image = UIImage(named: "profile")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2 - 8
        profileNameLabel.font = UIFont.systemFont(ofSize: 14)
        profileNameLabel.textColor = .white
        
    }

}

