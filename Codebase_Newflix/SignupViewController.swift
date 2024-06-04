//
//  SignupViewController.swift
//  Codebase_Newflix
//
//  Created by 김정윤 on 6/4/24.
//

import UIKit
import SnapKit

class SignupViewController: UIViewController {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "NEWFLIX"
        label.textColor = .systemRed
        label.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        return label
    }()
    
    let emailOrPhoneTextField: UITextField = {
        let textField = UITextField()
        textField.configureSignupTextField()
        textField.text = "이메일 주소 또는 전화번호"
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.configureSignupTextField()
        textField.text = "비밀번호"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.configureSignupTextField()
        textField.text = "닉네임"
        return textField
    }()
    
    let locationTextField: UITextField = {
        let textField = UITextField()
        textField.configureSignupTextField()
        textField.text = "위치"
        return textField
    }()
    
    let promoTextField: UITextField = {
        let textField = UITextField()
        textField.configureSignupTextField()
        textField.text = "추천 코드 입력"
        return textField
    }()
    
    let signupBtn: UIButton = {
        let button = UIButton()
        let attributedTitle = NSAttributedString(string: "회원가입", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .bold)])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 6
        return button
    }()
    
    let moreBtn: UIButton = {
        let button = UIButton()
        let attributedTitle = NSAttributedString(string: "추가 정보 입력", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    let onoffSwitch: UISwitch = {
        let onoff = UISwitch()
        onoff.onTintColor = .systemRed
        onoff.setOn(true, animated: true)
        return onoff
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupHierarchy()
        setupConstraints()
    }

    func setupHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(emailOrPhoneTextField)
        view.addSubview(passwordTextField)
        view.addSubview(nicknameTextField)
        view.addSubview(locationTextField)
        view.addSubview(promoTextField)
        view.addSubview(signupBtn)
        view.addSubview(moreBtn)
        view.addSubview(onoffSwitch)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.centerX.equalTo(view)
        }
        
        emailOrPhoneTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(80)
            $0.centerX.equalTo(view)
            $0.width.equalTo(view.snp.width).multipliedBy(0.8)
            $0.height.equalTo(45)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailOrPhoneTextField.snp.bottom).offset(12)
            $0.centerX.size.equalTo(emailOrPhoneTextField)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(12)
            $0.centerX.size.equalTo(passwordTextField)
        }
        
        locationTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(12)
            $0.centerX.size.equalTo(nicknameTextField)
        }
        
        promoTextField.snp.makeConstraints {
            $0.top.equalTo(locationTextField.snp.bottom).offset(12)
            $0.centerX.size.equalTo(locationTextField)
        }
        
        signupBtn.snp.makeConstraints {
            $0.top.equalTo(promoTextField.snp.bottom).offset(12)
            $0.height.equalTo(50)
            $0.centerX.width.equalTo(promoTextField)
        }
        
        moreBtn.snp.makeConstraints {
            $0.leading.equalTo(signupBtn.snp.leading)
            $0.top.equalTo(signupBtn.snp.bottom).offset(12)
        }
        
        onoffSwitch.snp.makeConstraints {
            $0.trailing.equalTo(signupBtn.snp.trailing)
            $0.top.equalTo(moreBtn)
        }
    }
    
    // 뷰 탭하면 키보드 내려가게
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
