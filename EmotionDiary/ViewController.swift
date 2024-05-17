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
    
    let emotions: [String] = ["좋아해", "행복해", "사랑해", "당황해", "속상해", "피곤해", "씁쓸해", "이상해", "우울해"]
    var emotionsDict: [String:Int] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in (0..<emotions.count) {
            configureEmotions(imageView: emotionImageViewCollection[i], imageName: "slime\(i+1)", label: emotionLabelCollection[i], emotion: emotions[i])
        }
        setupNavigation()
    }

    func setupNavigation() {
        navigationItem.title = "감정일기"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func configureEmotions(imageView: UIImageView, imageName: String, label: UILabel, emotion: String) {
        emotionsDict[emotion] = 0
        
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        label.textAlignment = .center
        label.text = "\(emotion) 0"
    }
    
    @IBAction func likeBtnTapped(_ sender: UIButton) {
        emotionsDict["좋아해"]! += 1
        emotionLabelCollection[0].text = "좋아해 \(emotionsDict["좋아해"]!)"
    }
    
    @IBAction func happyBtnTapped(_ sender: UIButton) {
        emotionsDict["행복해"]! += 1
        emotionLabelCollection[1].text = "행복해 \(emotionsDict["행복해"]!)"
    }
    
    @IBAction func loveBtnTapped(_ sender: UIButton) {
        emotionsDict["사랑해"]! += 1
        emotionLabelCollection[2].text = "사랑해 \(emotionsDict["사랑해"]!)"
    }
    
    @IBAction func upsetBtnTapped(_ sender: UIButton) {
        emotionsDict["당황해"]! += 1
        emotionLabelCollection[3].text = "당황해 \(emotionsDict["당황해"]!)"
    }
    
    @IBAction func sadBtnTapped(_ sender: UIButton) {
        emotionsDict["속상해"]! += 1
        emotionLabelCollection[4].text = "속상해 \(emotionsDict["속상해"]!)"
    }
    
    @IBAction func tiredBtnTapped(_ sender: UIButton) {
        emotionsDict["피곤해"]! += 1
        emotionLabelCollection[5].text = "피곤해 \(emotionsDict["피곤해"]!)"
    }
    
    @IBAction func badBtnTapped(_ sender: UIButton) {
        emotionsDict["씁쓸해"]! += 1
        emotionLabelCollection[6].text = "씁쓸해 \(emotionsDict["씁쓸해"]!)"
    }
    
    @IBAction func weirdBtnTapped(_ sender: UIButton) {
        emotionsDict["이상해"]! += 1
        emotionLabelCollection[7].text = "이상해 \(emotionsDict["이상해"]!)"
    }
    
    @IBAction func downBtnTapped(_ sender: UIButton) {
        emotionsDict["우울해"]! += 1
        emotionLabelCollection[8].text = "우울해 \(emotionsDict["우울해"]!)"
    }
    
}

