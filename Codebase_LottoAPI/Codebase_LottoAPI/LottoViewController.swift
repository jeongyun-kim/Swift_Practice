//
//  LottoViewController.swift
//  Codebase_LottoAPI
//
//  Created by 김정윤 on 6/4/24.
//

import UIKit
import SnapKit
import Alamofire

class LottoViewController: UIViewController {
    let one: UILabel = {
        let label = UILabel()
        label.configureBall()
        return label
    }()
    
    let two: UILabel = {
        let label = UILabel()
        label.configureBall()
        return label
    }()
    
    let three: UILabel = {
        let label = UILabel()
        label.configureBall()
        return label
    }()
    
    let four: UILabel = {
        let label = UILabel()
        label.configureBall()
        return label
    }()
    
    let five: UILabel = {
        let label = UILabel()
        label.configureBall()
        return label
    }()
    
    let six: UILabel = {
        let label = UILabel()
        label.configureBall()
        return label
    }()
    
    let plus: UILabel = {
        let label = UILabel()
        label.text = "+"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .center
        label.textColor = .gray
        return label
    }()
    
    let bonus: UILabel = {
        let label = UILabel()
        label.configureBall()
        return label
    }()
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        return stackView
    }()

    let descLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    let lottoUrl = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1122"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        network()
        setupHierarchy()
        setupConstraints()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
    }
    
    private func setupHierarchy() {
        view.addSubview(horizontalStackView)
        [one, two, three, four, five, six, plus, bonus].forEach {
            horizontalStackView.addArrangedSubview($0)
        }
        view.addSubview(descLabel)
    }
    
    private func setupConstraints() {
        horizontalStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.height.equalTo(40)
            $0.width.equalTo(348)
            $0.centerX.equalToSuperview()
        }
        
        descLabel.snp.makeConstraints {
            $0.centerX.equalTo(horizontalStackView)
            $0.top.equalTo(horizontalStackView.snp.bottom).offset(8)
        }
    }
    
    private func network() {
        AF.request(lottoUrl).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):
                print(value)
                self.one.text = "\(value.drwtNo1)"
                self.two.text = "\(value.drwtNo2)"
                self.three.text = "\(value.drwtNo3)"
                self.four.text = "\(value.drwtNo4)"
                self.five.text = "\(value.drwtNo5)"
                self.six.text = "\(value.drwtNo6)"
                self.bonus.text = "\(value.bnusNo)"
                self.descLabel.text = "\(value.desc)"
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
