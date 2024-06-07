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
    let newlyKeywords = Word.examples
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getRandomSearchKeywords()
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
            btn.tag = i
            btn.contentEdgeInsets = .init(top: 7, left: 7, bottom: 7, right: 7)
        }
    
        searchResultImageView.contentMode = .scaleAspectFill
        
        searchResultLabel.textAlignment = .center
        searchResultLabel.font = UIFont.systemFont(ofSize: 18)
        searchResultLabel.numberOfLines = 0
    }
    
    // 검색어 랜덤으로 가져와 보여주기
    func getRandomSearchKeywords() {
        var randomKeywords: [String] = []
        while (randomKeywords.count < 4) {
            guard let randomKeywordData = newlyKeywords.randomElement() else { return }
            if randomKeywordData.word != searchBarTextField.text ?? "" && !randomKeywords.contains(randomKeywordData
                .word) {
                randomKeywords.append(randomKeywordData.word)
            } else {
                continue
            }
        }
        // 랜덤키워드 버튼에 세팅
        for i in (0..<searchKeywordsBtnCollection.count) {
            searchKeywordsBtnCollection[i].setTitle(randomKeywords[i], for: .normal)
        }
    }
    
    // 검색
    // 검색어가 없을 때 / 검색결과가 없을 때 / 검색결과 출력
    func search() {
        guard let searchKeyword = searchBarTextField.text else { return }
        let searchedDatas = newlyKeywords.filter{ $0.word == searchKeyword }
        var text: String
        
        if searchKeyword.isEmpty { // 검색어 없을 때
            text = "검색어를 입력해주세요"
        } else if searchedDatas.isEmpty { // 검색결과 없을 때
            text = "검색결과가 없습니다"
        } else { // 검색결과 있을 때
            text = searchedDatas.first!.desc
        }
        searchResultLabel.text = text
        getRandomSearchKeywords()
    }
    
    // 키워드 버튼 눌렀을 때, 해당 키워드 서치바에 보여주기
    @IBAction func keywordBtnTapped(_ sender: UIButton) {
        searchBarTextField.text = sender.currentTitle
    }
    
    // 검색버튼 또는 Return 버튼 눌렀을 때 검색하고 키보드 내리기
    @IBAction func searchBtnTappedOrKeyboardReturn(_ sender: Any) {
        search()
        view.endEditing(true)
    }
    
    // 뷰 눌러서 키보드 내리기
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

