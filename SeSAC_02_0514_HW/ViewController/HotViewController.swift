//
//  HotViewController.swift
//  SeSAC_02_0514_HW
//
//  Created by 김정윤 on 5/16/24.
//

import UIKit

class HotViewController: UIViewController {
    @IBOutlet var popularContentsStackView: UIStackView!
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchView: UIView!
    @IBOutlet var searchImageView: UIImageView!
    
    @IBOutlet var tagBtns: [UIButton]!

    @IBOutlet var alertLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    
    let tagDatas = Tag.tagDatas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        navigationItem.title = "New & Hot 검색"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.view.backgroundColor = .black
        
        searchView.backgroundColor = .darkGray
        searchView.layer.cornerRadius = 10
        
        searchImageView.image = UIImage(systemName: "magnifyingglass")
        searchImageView.tintColor = .gray
        searchTextField.borderStyle = .none
        searchTextField.layer.cornerRadius = 10
        searchTextField.backgroundColor = .darkGray
        searchTextField.attributedPlaceholder = NSAttributedString(string: "게임, 시리즈, 영화를 검색하세요...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    
        for i in (0..<tagBtns.count) {
            let btn = tagBtns[i]
            let tagData = tagDatas[i]
            btn.tag = i
            btn.configuration?.imagePadding = 2
            btn.backgroundColor = .black
            btn.layer.cornerRadius = 16
            btn.invalidateIntrinsicContentSize()
            btn.setImage(UIImage(named: tagData.imageName), for: .normal)
            btn.setAttributedTitle(NSAttributedString(string: tagData.title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]), for: .normal)
            btn.configuration?.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
            btn.tintColor = .white
        }
        
        popularContentsStackView.isHidden = true
        
        alertLabel.textAlignment = .center
        alertLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        alertLabel.textColor = .white
        descLabel.textColor = .gray
        descLabel.font = UIFont.systemFont(ofSize: 18)
        descLabel.numberOfLines = 0
        descLabel.textAlignment = .center
        alertLabel.isHidden = true
        descLabel.isHidden = true
    }

    @IBAction func tagBtnTapped(_ sender: UIButton) {
        // 모든 태그 돌아서 선택되어있던 다른 태그 배경 검은색, 글자 하얀색
        // [0], [2] 태그에는 alert, desc Label에 텍스트 넣어주기
        // [1] 태그에는 영화 포스터 스택뷰 보여주기
        for tagBtn in tagBtns {
            if tagBtn.tag != sender.tag {
                tagBtn.backgroundColor = .black
                tagBtn.tintColor = .white
            } else {
                tagBtn.backgroundColor = .white
                tagBtn.tintColor = .black
                // 현재 선택중인 태그 데이터
                let tagData = tagDatas[tagBtn.tag]
                if tagData.alert == nil {
                    // 만약 alert 글이 없다면 [1] 태그
                    alertLabel.isHidden = true
                    descLabel.isHidden = true
                    popularContentsStackView.isHidden = false
                } else { // 만약 alert글이 있다면 [0], [2] 태그
                    alertLabel.isHidden = false
                    descLabel.isHidden = false
                    popularContentsStackView.isHidden = true
                    alertLabel.text = tagData.alert
                    descLabel.text = tagData.desc
                }
            }
        }
    }
}


