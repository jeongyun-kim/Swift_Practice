//
//  ViewController.swift
//  EmotionDiary
//
//  Created by 김정윤 on 5/17/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var emotionImageViewCollection: [UIImageView]!
    @IBOutlet var emotionLabelCollection: [UILabel]!
    @IBOutlet var emotionBtns: [UIButton]!
    
    let emotions: [String] = ["좋아해", "행복해", "사랑해", "당황해", "속상해", "피곤해", "씁쓸해", "이상해", "우울해"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupEmotion()
    }

    // 감정 카운트 보여주기
    func setupEmotion() {
        for i in (0..<emotions.count) {
            designEmotion(at: i)
        }
    }
    
    func setupNavigation() {
        navigationItem.title = "감정일기"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "리셋", style: .plain, target: self, action: #selector(resetBtnTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    // 감정 UI 디자인
    func designEmotion(at i: Int) {
        let emotionLabel = emotionLabelCollection[i]
        let emotionImageView = emotionImageViewCollection[i]
        let emotionCnt = UserDefaults.standard.integer(forKey: emotions[i])
        print(emotions[i], emotionCnt)
        emotionLabel.text = "\(emotions[i]) \(emotionCnt)"
        emotionLabel.textAlignment = .center
        emotionImageView.image = UIImage(named: "slime\(i+1)")
        emotionImageView.contentMode = .scaleAspectFit
        emotionBtns[i].tag = i
    }
    
    // 감정 카운트 리셋
    @objc func resetBtnTapped() {
        // UserDefault에 저장된 key 돌면서 value 삭제
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key)
        }
        // 삭제 후에 감정뷰 다시 불러오기
        setupEmotion()
    }
    
    @IBAction func emotionBtnTapped(_ sender: UIButton) {
        let i = sender.tag
        // 감정
        let emotion = emotions[i]
        // 해당 감정의 카운트 +1
        let emotionCnt = UserDefaults.standard.integer(forKey: emotion) + 1
        // 감정 카운트 저장
        UserDefaults.standard.set(emotionCnt, forKey: emotion)
        // 감정 카운트 label에 표시
        emotionLabelCollection[i].text = "\(emotions[i]) \(emotionCnt)"
    }
}

