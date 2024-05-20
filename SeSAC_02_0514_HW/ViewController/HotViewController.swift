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
    
    @IBOutlet var willBeReleaseTagBtn: UIButton!
    @IBOutlet var popularContentsTagBtn: UIButton!
    @IBOutlet var top10SeriesTagBtn: UIButton!
    
    @IBOutlet var alertLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    
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
        
        setupBtn(btn: willBeReleaseTagBtn, imageName: "blue", title: "공개 예정")
        setupBtn(btn: popularContentsTagBtn, imageName: "turquoise", title: "모두의 인기 콘텐츠")
        setupBtn(btn: top10SeriesTagBtn, imageName: "pink", title: "TOP 10 시리즈")
        
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
    
    func setupBtn(btn: UIButton, imageName: String, title: String) {
        btn.configuration?.imagePadding = 2
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 16
        btn.invalidateIntrinsicContentSize()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setAttributedTitle(NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]), for: .normal)
        btn.tintColor = .white
    }
    
    @IBAction func willBeReleaseTagBtnTapped(_ sender: Any) {
        willBeReleaseTagBtn.backgroundColor = .white
        willBeReleaseTagBtn.tintColor = .black
        popularContentsTagBtn.tintColor = .white
        popularContentsTagBtn.backgroundColor = .black
        top10SeriesTagBtn.tintColor = .white
        top10SeriesTagBtn.backgroundColor = .black
        
        alertLabel.isHidden = false
        descLabel.isHidden = false
        alertLabel.text = "이런! 찾으시는 작품이 없습니다."
        descLabel.text = "다른 영화, 시리즈, 배우, 감독 또는 시리즈를 검색해보세요"
        
        popularContentsStackView.isHidden = true
    }
    
    @IBAction func popularContentsTagBtnTapped(_ sender: Any) {
        willBeReleaseTagBtn.backgroundColor = .black
        willBeReleaseTagBtn.tintColor = .white
        popularContentsTagBtn.backgroundColor = .white
        popularContentsTagBtn.tintColor = .black
        top10SeriesTagBtn.backgroundColor = .black
        top10SeriesTagBtn.tintColor = .white
        
        alertLabel.isHidden = true
        descLabel.isHidden = true
        
        popularContentsStackView.isHidden = false
    }
    
    @IBAction func top10SeriesTagBtnTapped(_ sender: Any) {
        willBeReleaseTagBtn.backgroundColor = .black
        willBeReleaseTagBtn.tintColor = .white
        popularContentsTagBtn.backgroundColor = .black
        popularContentsTagBtn.tintColor = .white
        top10SeriesTagBtn.backgroundColor = .white
        top10SeriesTagBtn.tintColor = .black
        
        popularContentsStackView.isHidden = true
        
        alertLabel.isHidden = false
        descLabel.isHidden = false
        
        alertLabel.text = "여기는 탑텐시리즈가 나올거에요~!~"
        descLabel.text = " :) "
    }
    
}


