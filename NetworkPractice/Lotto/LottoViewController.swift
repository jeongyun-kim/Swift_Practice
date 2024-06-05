//
//  LottoViewController.swift
//  NetworkPractice
//
//  Created by 김정윤 on 6/5/24.
//

import UIKit
import Alamofire
import SnapKit

class LottoViewController: UIViewController, setup {
    
    var list: [String] = Lotto.LottoDates
    
    let pickerView = UIPickerView()
    
    let drwNotextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.4
        textField.layer.cornerRadius = 6
        textField.tintColor = .clear
        textField.textAlignment = .center
        return textField
    }()
    
    let guideLabel: UILabel = {
        let label = UILabel()
        label.text = "당첨번호 안내"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let drwNoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    let border: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    let resultNoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .systemYellow
        return label
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "당첨결과"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }()
    
    let lottoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        return stackView
    }()
    
    let drwtNo1 = UILabel()
    let drwtNo2 = UILabel()
    let drwtNo3 = UILabel()
    let drwtNo4 = UILabel()
    let drwtNo5 = UILabel()
    let drwtNo6 = UILabel()
    let plus: UILabel = {
        let label = UILabel()
        label.text = "+"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    let bnusNo = UILabel()
    let bnusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "보너스"
        label.textColor = .lightGray
        return label
    }()


    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()
        setupPickerView()
        setupUI()
        network()
    }
    
    func setupHierarchy() {
        view.addSubview(drwNotextField)
        view.addSubview(guideLabel)
        view.addSubview(drwNoLabel)
        view.addSubview(border)
        view.addSubview(stackView)
        [resultNoLabel, resultLabel].forEach { label in
            stackView.addArrangedSubview(label)
        }
        view.addSubview(lottoStackView)
        [drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6, plus, bnusNo].forEach {
            lottoStackView.addArrangedSubview($0)
        }
        view.addSubview(bnusLabel)
    }
    
    func setupConstraints() {
        drwNotextField.snp.makeConstraints {
            $0.height.equalTo(45)
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        guideLabel.snp.makeConstraints {
            $0.leading.equalTo(drwNotextField.snp.leading)
            $0.top.equalTo(drwNotextField.snp.bottom).offset(20)
        }
        
        drwNoLabel.snp.makeConstraints {
            $0.trailing.equalTo(drwNotextField.snp.trailing)
            $0.top.equalTo(drwNotextField.snp.bottom).offset(20)
        }
        
        border.snp.makeConstraints {
            $0.horizontalEdges.equalTo(drwNotextField)
            $0.height.equalTo(1)
            $0.top.equalTo(guideLabel.snp.bottom).offset(12)
        }
        
        stackView.snp.makeConstraints {
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(border).offset(24)
        }
        
        lottoStackView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(24)
            $0.width.equalTo(334)
            $0.height.equalTo(40)
            $0.centerX.equalTo(view)
        }
        
        bnusLabel.snp.makeConstraints {
            $0.trailing.equalTo(lottoStackView.snp.trailing).inset(2)
            $0.top.equalTo(lottoStackView.snp.bottom).offset(4)
        }
    }
    
    func setupPickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        drwNotextField.inputView = pickerView
        [drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6, bnusNo].forEach {
            $0.configureLottoLabel()
        }
    }
    
    func network() {
        AF.request(LottoUrl.lottoUrl).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):
                self.configureLottoData(value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func configureLottoData(_ data: Lotto) {
        configureLottoBall(data.drwtNo1, label: drwtNo1)
        configureLottoBall(data.drwtNo2, label: drwtNo2)
        configureLottoBall(data.drwtNo3, label: drwtNo3)
        configureLottoBall(data.drwtNo4, label: drwtNo4)
        configureLottoBall(data.drwtNo5, label: drwtNo5)
        configureLottoBall(data.drwtNo6, label: drwtNo6)
        configureLottoBall(data.bnusNo, label: bnusNo)
        resultNoLabel.text = "\(data.drwNo)회"
        drwNoLabel.text = "\(data.drwNoDate) 추첨"
    }
    
    func configureLottoBall(_ drwtNo: Int, label: UILabel) {
        var backgroundColor: UIColor = .clear
        switch drwtNo {
        case 1...10: backgroundColor = .systemYellow
        case 11...20: backgroundColor = .systemBlue
        case 21...30: backgroundColor = .systemRed
        case 31...40: backgroundColor = .lightGray
        case 41...45: backgroundColor = .systemGreen
        default: break
        }
        label.backgroundColor = backgroundColor
        label.text = "\(drwtNo)"
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: PickerViewExtension
extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        drwNotextField.text = list[row]
        LottoUrl.drwNo = list[row]
        network()
    }
}
