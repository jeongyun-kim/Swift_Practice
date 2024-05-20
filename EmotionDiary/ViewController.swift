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
    var emotionsCnt: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in (0..<emotions.count) {
            configureEmotion(at: i)
        }
        setupNavigation()
    }

    func setupNavigation() {
        navigationItem.title = "감정일기"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func configureEmotion(at i: Int) {
        let emotionLabel = emotionLabelCollection[i]
        let emotionImageView = emotionImageViewCollection[i]
        emotionLabel.text = "\(emotions[i]) \(emotionsCnt[i])"
        emotionLabel.textAlignment = .center
        emotionImageView.image = UIImage(named: "slime\(i+1)")
        emotionImageView.contentMode = .scaleAspectFit
        emotionBtns[i].tag = i
    }
    
    @IBAction func emotionBtnTapped(_ sender: UIButton) {
        let i = sender.tag
        emotionsCnt[i] += 1
        emotionLabelCollection[i].text = "\(emotions[i]) \(emotionsCnt[i])"
    }    
}

