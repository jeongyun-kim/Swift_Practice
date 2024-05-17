//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by 김정윤 on 5/17/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var searchKeywordsBtnCollection: [UIButton]!
    @IBOutlet var searchBarTextField: UITextField!
    @IBOutlet var searchResultLabel: UILabel!
    @IBOutlet var searchResultImageView: UIImageView!
    @IBOutlet var searchBtn: UIButton!
    @IBOutlet var searchStackView: UIStackView!
    
    // 신조어 
    let newlyKeywordsDict: [String: String] = [
        "중꺽마": "중요한 것은 꺾이지 않는 마음!🔥",
        "디토합니다": "'나도 그래요', '동감입니다' 라는 의미",
        "가나디": "강아지를 귀여운 방식으로 표현",
        "캘박": "캘린더에 박제",
        "최최차차": "최애는 최애고 차은우는 차은우",
        "당모치": "당연히 모든 치킨은 옳다",
        "스불재": "스스로 불러온 재앙"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        searchStackView.layer.borderColor = UIColor.black.cgColor
        searchStackView.layer.borderWidth = 3
        
        searchBarTextField.font = UIFont.systemFont(ofSize: 16)
        searchBarTextField.autocorrectionType = .no
        
        searchBtn.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchBtn.setTitle("", for: .normal)
        searchBtn.tintColor = .white
        searchBtn.backgroundColor = .black
        
        for i in (0..<searchKeywordsBtnCollection.count) {
            let btn = searchKeywordsBtnCollection[i]
            btn.layer.borderColor = UIColor.black.cgColor
            btn.layer.borderWidth = 1.5
            btn.layer.cornerRadius = 10
            btn.tintColor = .black
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.contentEdgeInsets = .init(top: 7, left: 7, bottom: 7, right: 7)
        }
        getRandomSearchKeywords()
    
        searchResultImageView.contentMode = .scaleAspectFill
        
        searchResultLabel.textAlignment = .center
        searchResultLabel.font = UIFont.systemFont(ofSize: 18)
        searchResultLabel.numberOfLines = 0
    }
    
    // 뷰 눌러서 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // 검색어 랜덤으로 가져와 보여주기
    func getRandomSearchKeywords() {
        var randomKeywords: [String] = []
        while (randomKeywords.count < 4) {
            guard let randomKeyword = Array(newlyKeywordsDict.keys).randomElement() else { return }
            if !randomKeywords.contains(randomKeyword) {
                randomKeywords.append(randomKeyword)
            } else {
                continue
            }
        }
        for i in (0..<searchKeywordsBtnCollection.count) {
            searchKeywordsBtnCollection[i].setTitle(randomKeywords[i], for: .normal)
        }
    }
    
    // 키워드 버튼 눌렀을 때, 해당 키워드 서치바에 보여주기
    func setSearchKeyword(idx: Int) {
        guard let searchKeyword = searchKeywordsBtnCollection[idx].titleLabel?.text else { return }
        searchBarTextField.text = searchKeyword
    }
    
    // 검색
    // 검색어가 없을 때 / 검색결과가 없을 때 / 검색결과 출력
    func search() {
        guard let searchKeyword = searchBarTextField.text else { return }
        var text: String
        
        if searchKeyword.isEmpty {
            text = "검색어를 입력해주세요"
        } else if !Array(newlyKeywordsDict.keys).contains(searchKeyword) {
            text = "검색결과가 없습니다"
        } else {
            text = newlyKeywordsDict[searchKeyword]!
        }
        searchResultLabel.text = text
    }
    
    @IBAction func searchBtnTapped(_ sender: UIButton) {
        search()
    }
    
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        search()
    }
    
    @IBAction func searchKeywordBtn1Tapped(_ sender: UIButton) {
            setSearchKeyword(idx: 0)
    }
    
    @IBAction func searchKeywordBtn2Tapped(_ sender: UIButton) {
        setSearchKeyword(idx: 1)
    }
    
    @IBAction func searchKeywordBtn3Tapped(_ sender: UIButton) {
        setSearchKeyword(idx: 2)
    }
    
    @IBAction func searchKeywordBtn4Tapped(_ sender: UIButton) {
        setSearchKeyword(idx: 3)
    }
}

