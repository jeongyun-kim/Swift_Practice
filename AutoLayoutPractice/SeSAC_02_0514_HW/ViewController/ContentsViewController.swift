//
//  ContentsViewController.swift
//  SeSAC_02_0514_HW
//
//  Created by 김정윤 on 5/16/24.
//

import UIKit

class ContentsViewController: UIViewController {
    @IBOutlet var bigLabel: UILabel!
    @IBOutlet var smallLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var settingBtn: UIButton!
    @IBOutlet var moreBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        navigationItem.title = "저장한 콘텐츠 목록"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.view.backgroundColor = .black
        
        setLabel(label: bigLabel, size: 24, text: "'나만의 자동 저장' 기능", weight: .bold, color: .white)
        setLabel(label: smallLabel, size: 16, text: "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다.\n디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할틈이 없어요.", weight: .regular, color: .gray)
        
        imageView.image = UIImage(named: "dummy")
        imageView.contentMode = .scaleAspectFill
        
        setBtn(btn: settingBtn, title: "설정하기", color: .systemIndigo, tintColor: .white)
        setBtn(btn: moreBtn, title: "저장한 콘텐츠 살펴보기", color: .white, tintColor: .black)
    }
    
    func setLabel(label: UILabel, size: CGFloat, text: String, weight: UIFont.Weight, color: UIColor) {
        label.text = text
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = color
    }
    
    func setBtn(btn: UIButton, title: String, color: UIColor, tintColor: UIColor) {
        btn.setAttributedTitle(NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)]), for: .normal)
        btn.backgroundColor = color
        btn.tintColor = tintColor
        btn.layer.cornerRadius = 6
    }
}
