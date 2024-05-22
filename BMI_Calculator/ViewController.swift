//
//  ViewController.swift
//  BMI_Calculator
//
//  Created by 김정윤 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var getSaveDataBtn: UIButton!
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
    
    func setupUI() {
        imageView.image = UIImage(named: "image")
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        titleLabel.text = "BMI Calculator"
        
        descLabel.numberOfLines = 0
        descLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        descLabel.text = "당신의 BMI 지수를 알려드릴게요."
        
        randomCalculateBtn.setTitle("랜덤으로 BMI 계산하기", for: .normal)
        randomCalculateBtn.setAttributedTitle(NSAttributedString(string: "랜덤으로 BMI 계산하기", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]), for: .normal)
        randomCalculateBtn.tintColor = .systemRed
        
        configureLabel(q1Label, text: "키가 어떻게 되시나요?")
        configureLabel(q2Label, text: "몸무게는 어떻게 되시나요?")
        
        configureTextField(heightTextField, placeHolder: "키를 입력해주세요 (100이상 250이하)")
        configureTextField(weightTextField, placeHolder: "몸무게를 입력해주세요 (20이상 200이하)")
        
        configureUIView(heightView)
        configureUIView(weightView)
        
        calculateBtn.setTitle("결과 확인", for: .normal)
        calculateBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        calculateBtn.backgroundColor = .purple
        calculateBtn.tintColor = .white
        calculateBtn.layer.cornerRadius = 12
        
        getSaveDataBtn.setTitle("데이터 불러오기", for: .normal)
        getSaveDataBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        getSaveDataBtn.tintColor = .systemBlue
    }
    
    func configureTextField(_ textField: UITextField, placeHolder: String) {
        textField.borderStyle = .none
        //textField.keyboardType = .decimalPad
        textField.placeholder = placeHolder
    }
    
    func configureUIView(_ view: UIView) {
        view.layer.cornerRadius = 18
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1.5
    }
    
    func configureLabel(_ label: UILabel, text: String) {
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16)
    }

    
    func alert(title: String, weight: Float? = nil, height: Float? = nil) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .cancel)
        let save = UIAlertAction(title: "저장", style: .default) { _ in
            UserDefaults.standard.set([height, weight], forKey: "내 데이터")
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
        alert(title: "당신의 BMI는 \(bmiString)이며\n\(result)입니다", weight: weight, height: height)
    }

    @IBAction func getSavedataBtnTapped(_ sender: UIButton) {
        guard let savedata = UserDefaults.standard.array(forKey: "내 데이터") else {
            alert(title: "저장된 데이터가 없습니다!")
            return }
        heightTextField.text = "\(savedata[0])"
        weightTextField.text = "\(savedata[1])"
        
    }
    
    @IBAction func calculateBtnTapped() {
        // 공백 제거
        var weight = weightTextField.text!.components(separatedBy: " ").joined()
        var height = heightTextField.text!.components(separatedBy: " ").joined()
        // 입력값이 모두 비어있을 때
        if weight == "" && height == "" {
            alert(title: "키와 몸무게를 입력해주세요")
        } else {
            guard let heightFloat = Float(height), let weightFloat = Float(weight) else {
                alert(title: "키와 몸무게를 제대로 입력해주세요")
                return
            }
            // 몸무게가 20미만 또는 200초과, 키가 100미만 또는 250초과일 때
            // 키가 100미만 또는 키가 250초과일 때
            // 몸무게가 20미만 또는 200초과일 때
            // 몸무게가 20이상일 때, 키가 100이상 250이하일 때 ✓
            if (weightFloat < 20 || weightFloat > 200) && (heightFloat < 100 || heightFloat > 250) {
                alert(title: "키와 몸무게를 확인해주세요")
            } else if heightFloat < 100 || heightFloat >= 250 {
                alert(title: "키를 확인해주세요")
            } else if weightFloat < 20 || weightFloat > 200 {
                alert(title: "몸무게를 확인해주세요")
            } else {
                calculateBMI(weight: weightFloat, height: heightFloat)
            }
        }
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

