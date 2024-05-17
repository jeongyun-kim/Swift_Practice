//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by 김정윤 on 5/17/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var searchBarTextField: UITextField!
    @IBOutlet var searchResultLabel: UILabel!
    @IBOutlet var searchResultImageView: UIImageView!
    @IBOutlet var searchBtn: UIButton!
    @IBOutlet var searchStackView: UIStackView!
    
    let newlyKeywordsDict: [String: String] = [
        "중꺽마": "중요한 것은 꺾이지 않는 마음!🔥",
        "디토합니다": "'나도 그래요', '동감입니다' 라는 의미를 가짐",
        "가나디": "강아지를 귀여운 방식으로 표현",
        "캘박": "캘린더에 박제",
        "최최차차": "최애는 최애고 차은우는 차은우",
        "당모치": "당연히 모든 치킨은 옳다",
        "스불재": "스스로 불러온 재앙"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    func setupUI() {
        searchStackView.layer.borderColor = UIColor.black.cgColor
        searchStackView.layer.borderWidth = 4
        
        searchBarTextField.font = UIFont.systemFont(ofSize: 16)
        searchBarTextField.autocorrectionType = .no
        searchBtn.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchBtn.setTitle("", for: .normal)
        searchBtn.tintColor = .white
        searchBtn.backgroundColor = .black
        
        searchResultImageView.contentMode = .scaleAspectFill
        
        searchResultLabel.textAlignment = .center
        searchResultLabel.font = UIFont.systemFont(ofSize: 18)
        searchResultLabel.numberOfLines = 0
    }

}

