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
    

    let emotions: [String] = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "피곤해", "씁쓸해", "이상해", "우울해"]
    var emotionsDict: [String:Int] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in (0..<emotionLabelCollection.count) {
            configureEmotions(imageView: emotionImageViewCollection[i], imageName: "slime\(i+1)", label: emotionLabelCollection[i], emotion: emotions[i])
        }
    }

    func configureEmotions(imageView: UIImageView, imageName: String, label: UILabel, emotion: String) {
        emotionsDict[emotion] = 0
        
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        label.textAlignment = .center
        label.text = "\(emotion) 0"
    }
}

