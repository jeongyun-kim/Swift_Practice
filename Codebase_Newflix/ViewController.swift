//
//  ViewController.swift
//  Codebase_Newflix
//
//  Created by 김정윤 on 6/4/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = .systemBlue
        imageView.image = UIImage(named: "2")
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "background")
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let playBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.backgroundColor = .white
        return button
    }()
    
    let playImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "play_normal")
        return imageView
    }()
    
    let likeBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.backgroundColor = .darkGray
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setTitle(" 내가 찜한 리스트", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
    
    let nowHotLabel: UILabel = {
        let label = UILabel()
        label.text = "지금 뜨는 콘텐츠"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    let firstContentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        imageView.layer.cornerRadius = 10
        imageView.image = UIImage(named: "명량")
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let secondContentImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        imageView.layer.cornerRadius = 10
        imageView.image = UIImage(named: "아바타")
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let thirdContentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        imageView.layer.cornerRadius = 10
        imageView.image = UIImage(named: "암살")
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()
        setupUI("홈")
    }
    
    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(mainImageView)
        view.addSubview(playBtn)
        view.addSubview(playImageView)
        view.addSubview(likeBtn)
        view.addSubview(nowHotLabel)
        view.addSubview(firstContentImageView)
        view.addSubview(secondContentImageView)
        view.addSubview(thirdContentImageView)
    }
    
    private func setupConstraints() {
        mainImageView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
        
        backgroundImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(mainImageView.snp.bottom).offset(4)
        }
        
        playBtn.snp.makeConstraints {
            $0.leading.equalTo(mainImageView).offset(12)
            $0.bottom.equalTo(mainImageView).inset(12)
            $0.width.equalTo(mainImageView.snp.width).multipliedBy(0.45)
            $0.height.equalTo(mainImageView.snp.height).multipliedBy(0.1)
        }
        
        playImageView.snp.makeConstraints {
            $0.edges.equalTo(playBtn).inset(8)
        }
        
        likeBtn.snp.makeConstraints {
            $0.trailing.equalTo(mainImageView).offset(-12)
            $0.bottom.equalTo(mainImageView).inset(12)
            $0.size.equalTo(playBtn)
        }
        
        nowHotLabel.snp.makeConstraints {
            $0.top.equalTo(backgroundImageView.snp.bottom).offset(12)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(8)
        }
        
        firstContentImageView.snp.makeConstraints {
            $0.leading.equalTo(mainImageView)
            $0.top.equalTo(nowHotLabel.snp.bottom).offset(4)
            $0.height.equalTo(firstContentImageView.snp.width).multipliedBy(1.5)
        }
        
        secondContentImageView.snp.makeConstraints {
            $0.top.size.equalTo(firstContentImageView)
            $0.leading.equalTo(firstContentImageView.snp.trailing).offset(8)
        }
        
        thirdContentImageView.snp.makeConstraints {
            $0.top.size.equalTo(secondContentImageView)
            $0.leading.equalTo(secondContentImageView.snp.trailing).offset(8)
            $0.trailing.equalTo(mainImageView.snp.trailing)
        }
    }
}

