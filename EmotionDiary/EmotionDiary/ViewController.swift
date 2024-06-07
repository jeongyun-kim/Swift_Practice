//
//  ViewController.swift
//  EmotionDiary
//
//  Created by 김정윤 on 5/17/24.
//

import UIKit

enum Emotions: String, CaseIterable {
    case like = "좋아해"
    case happy = "행복해"
    case love = "사랑해"
    case embarrassed = "당황해"
    case sad = "속상해"
    case tired = "피곤해"
    case bitter = "씁쓸해"
    case weird = "이상해"
    case bad = "우울해"
}

class ViewController: UIViewController {
    @IBOutlet var emotionImageViewCollection: [UIImageView]!
    @IBOutlet var emotionLabelCollection: [UILabel]!
    @IBOutlet var emotionBtns: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupEmotion()
    }

    // 감정 카운트 보여주기
    func setupEmotion() {
        for (idx, emotion) in Emotions.allCases.enumerated() {
            designEmotion(at: idx, emotion.rawValue)
        }
    }
    
    func setupNavigation() {
        navigationItem.title = "감정일기"
        
        let leftBarBtn = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftBarBtn
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        let rightBarBtn = UIBarButtonItem(title: "리셋", style: .plain, target: self, action: #selector(resetBtnTapped))
        navigationItem.rightBarButtonItem = rightBarBtn
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    // 감정 UI 디자인
    func designEmotion(at idx: Int, _ emotion: String) {
        let emotionLabel = emotionLabelCollection[idx]
        let emotionImageView = emotionImageViewCollection[idx]
        let emotionCnt = UserDefaults.standard.integer(forKey: emotion)
        
        emotionLabel.text = "\(emotion) \(emotionCnt)"
        emotionLabel.textAlignment = .center
        emotionImageView.image = UIImage(named: "slime\(idx+1)")
        emotionImageView.contentMode = .scaleAspectFit
        emotionBtns[idx].tag = idx
    }
}


// MARK: Action 
extension ViewController {
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
        // 감정 이름 가져오기
        let emotion = Emotions.allCases[sender.tag].rawValue
        // 해당 감정의 카운트 +1
        let emotionCnt = UserDefaults.standard.integer(forKey: emotion) + 1
        // 감정 카운트 저장
        UserDefaults.standard.set(emotionCnt, forKey: emotion)
        // 감정 카운트 label에 표시
        emotionLabelCollection[sender.tag].text = "\(emotion) \(emotionCnt)"
    }
}
