//
//  ViewController.swift
//  BMI_Calculator
//
//  Created by 김정윤 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nickNameLabel: UILabel!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var getSavedataBtn: UIButton!
    @IBOutlet var weightView: UIView!
    @IBOutlet var heightView: UIView!
    @IBOutlet var calculateBtn: UIButton!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var q2Label: UILabel!
    @IBOutlet var q1Label: UILabel!
    @IBOutlet var randomCalculateBtn: UIButton!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // BMI : weight/(height*height*0.0001)
    func calculateBMI(weight: Float, height: Float) {
        let bmi = weight/(height*height*0.0001)
        var result: String
        // bmi에 따른 체중 구분
        switch bmi {
        case ..<18.5:
            result = "저체중🥺"
        case 18.5...22.9:
            result = "정상체중😉"
        case 23..<24.9:
            result = "비만😅"
        default:
            result = "과체중🥲"
        }
        let bmiString = String(format: "%.2f", bmi)
        showAlert(title: "당신의 BMI는 \(bmiString)이며\n\(result)입니다", weight: weight, height: height)
    }
}

// MARK: UI관련
extension ViewController {
    func setupUI() {
        imageView.image = UIImage(named: "image")
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.configureLabel("BMI Calculator", size: 26, weight: .bold)
        
        descLabel.numberOfLines = 0
        descLabel.configureLabel("당신의 BMI 지수를 알려드릴게요.", size: 18)
        
        [nickNameLabel: "닉네임이 어떻게 되시나요?", q1Label: "키가 어떻게 되시나요?", q2Label: "몸무게는 어떻게 되시나요?"].forEach { label, text in
            label?.configureLabel(text)
        }

        [heightTextField: "키를 입력해주세요 (100이상 250이하)", weightTextField: "몸무게를 입력해주세요 (20이상 200이하)", nicknameTextField: "닉네임을 입력해주세요"].forEach { tf, text in
            tf?.configureTextField(placeHolder: text)
        }

        nicknameTextField.setPaddingInTextField()
        
        [nicknameTextField, heightView, weightView].forEach { view in
            view?.configureUIView()
        }
        
        randomCalculateBtn.configureBtn("랜덤으로 BMI 계산하기", size: 14, color: .systemRed)
        
        calculateBtn.configureBtn("결과확인", size: 17, color: .white)
        calculateBtn.backgroundColor = .purple
        calculateBtn.layer.cornerRadius = 12
        
        getSavedataBtn.configureBtn("데이터 불러오기 및 리셋", size: 14, color: .systemBlue)
    }
}

// MARK: 액션
extension ViewController {
    @IBAction func getSavedataBtnTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "닉네임을 입력해주세요", message: nil, preferredStyle: .alert)
        alert.addTextField()
        // 데이터 불러오기
        let load = UIAlertAction(title: "불러오기", style: .default) { _ in
            guard let nickname = alert.textFields?.first?.text else {
                return
            }
            if let savedata = UserDefaults.standard.array(forKey: nickname) {
                self.nicknameTextField.text = nickname
                self.heightTextField.text = "\(savedata[0])"
                self.weightTextField.text = "\(savedata[1])"
            } else {
                self.showAlert(title: "해당 닉네임으로 저장된 데이터가 없습니다!")
            }
        }
        // 데이터 리셋
        let reset = UIAlertAction(title: "데이터 삭제", style: .destructive) { _ in
            guard let nickname = alert.textFields?.first?.text else { return }
            if let savedata = UserDefaults.standard.array(forKey: nickname) {
                UserDefaults.standard.removeObject(forKey: nickname)
                self.showAlert(title: "삭제가 완료되었습니다!")
            } else {
                self.showAlert(title: "삭제할 데이터가 없습니다!")
            }
        }
        // 취소
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(load)
        alert.addAction(reset)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    @IBAction func calculateBtnTapped() {
        // 닉네임 없으면 알림
        if removeWhitespace(nicknameTextField.text!).isEmpty {
            showAlert(title: "닉네임을 입력해주세요")
        } else {
            // 공백 제거
            let weight = removeWhitespace(weightTextField.text!)
            let height = removeWhitespace(heightTextField.text!)
            // 입력값이 모두 비어있을 때
            if weight.isEmpty && height.isEmpty {
                showAlert(title: "키와 몸무게를 입력해주세요")
            } else {
                guard let heightFloat = Float(height), let weightFloat = Float(weight) else {
                    showAlert(title: "키와 몸무게를 제대로 입력해주세요")
                    return
                }
                // 몸무게가 20미만 또는 200초과, 키가 100미만 또는 250초과일 때
                // 키가 100미만 또는 키가 250초과일 때
                // 몸무게가 20미만 또는 200초과일 때
                // 몸무게가 20이상일 때, 키가 100이상 250이하일 때
                if (weightFloat < 20 || weightFloat > 200) && (heightFloat < 100 || heightFloat > 250) {
                    showAlert(title: "키와 몸무게를 확인해주세요")
                } else if heightFloat < 100 || heightFloat >= 250 {
                    showAlert(title: "키를 확인해주세요")
                } else if weightFloat < 20 || weightFloat > 200 {
                    showAlert(title: "몸무게를 확인해주세요")
                } else {
                    calculateBMI(weight: weightFloat, height: heightFloat)
                }
            }
        }
    }
    
    func showAlert(title: String, weight: Float? = nil, height: Float? = nil) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .cancel)
        let save = UIAlertAction(title: "저장", style: .default) { _ in
            guard let nickname = self.nicknameTextField.text else { return }
            UserDefaults.standard.set([height, weight], forKey: nickname)
            self.showAlert(title: "저장이 완료되었습니다!")
        }
        alert.addAction(confirm)
        // 만약 BMI 계산을 거치지 않은 단순 알림창이라면
        guard let weight, let height else {
            present(alert, animated: true)
            return
        } // BMI 계산을 거친 알림창이라면
        alert.addAction(save)
        present(alert, animated: true)
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func randomBtnTapped(_ sender: UIButton) {
        let weight: Float = Float.random(in: 20...200)
        let height: Float = Float.random(in: 100...250)
        weightTextField.text = String(format: "%.2f", weight)
        heightTextField.text = String(format: "%.2f", height)
    }
}

