//
//  singUpViewController.swift
//  SeSAC_02_0514_HW
//
//  Created by 김정윤 on 5/16/24.
//

import UIKit

class singUpViewController: UIViewController {
    @IBOutlet var `switch`: UISwitch!
    @IBOutlet var addLabel: UILabel!
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet var signUpBtn: UIButton!
    
    let texts: [String] = ["이메일 주소 또는 전화번호", "비밀번호", "닉네임", "위치", "추천코드 입력", "회원가입"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = .black
        
        logoImageView.image = UIImage(named: "wordmark")
        logoImageView.contentMode = .scaleAspectFit
        
        for i in (0..<textFields.count) {
            textFields[i].text = texts[i]
            if texts[i] == "비밀번호" {
                textFields[i].isSecureTextEntry = true
            } else if texts[i] == "이메일 주소 또는 전화번호" {
                textFields[i].keyboardType = .emailAddress
            }
            textFields[i].textColor = .white
            textFields[i].textAlignment = .center
            textFields[i].backgroundColor = .darkGray
            textFields[i].borderStyle = .none
            textFields[i].layer.cornerRadius = 5
        }
        
        signUpBtn.backgroundColor = .white
        let attributedString = NSAttributedString(string: "회원가입", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.black])
        signUpBtn.setAttributedTitle(attributedString, for: .normal)
        signUpBtn.layer.cornerRadius = 5
        
        addLabel.text = "추가 정보 입력"
        addLabel.textColor = .white
        
        `switch`.onTintColor = .systemRed
        `switch`.setOn(true, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        view.endEditing(true)
    }
}
