//
//  ButtonViewController.swift
//  SeSAC_02_0514_HW
//
//  Created by 김정윤 on 5/17/24.
//

import UIKit

class ButtonViewController: UIViewController {

    @IBOutlet var practiceBtn: UIButton!
    
    // iOS 15+ : plain
    // legacy : default
    // iOS15+에서 작성하는 코드와 15 미만 코드가 다름
    // = default / plain 스타일을 다루는 코드가 다름
    override func viewDidLoad() {
        super.viewDidLoad()
        // default 타입에서 적용 가능
        practiceBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        // tmeplate image : 형태만 따옴
        // original image : 진짜 이미지
        let image = UIImage(systemName: "blue")?.withRenderingMode(.alwaysOriginal)
        practiceBtn.setImage(image, for: .normal)
    }

}
