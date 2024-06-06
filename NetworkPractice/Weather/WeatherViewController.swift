//
//  WeatherViewController.swift
//  NetworkPractice
//
//  Created by 김정윤 on 6/6/24.
//

import UIKit
import Alamofire
import SnapKit

class WeatherViewController: UIViewController, setup {
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = Axis.horizontalAxis
        stackView.distribution = .fillProportionally
        stackView.spacing = 12
        return stackView
    }()
    
    let locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "location.fill")
        imageView.tintColor = .accent
        return imageView
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = Font.regularTitleFont
        label.text = "서울"
        return label
    }()
    
    let shareBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .accent
        return button
    }()
    
    let refreshBtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        button.tintColor = .accent
        return button
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = Font.descFont
        label.text = WeatherUrl.today
        return label
    }()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()
        tableView.backgroundColor = .clear
        //network()
    }
    
    func setupHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(dateLabel)
        view.addSubview(locationImageView)
        view.addSubview(stackView)
        [locationImageView, cityLabel, shareBtn, refreshBtn].forEach {
            stackView.addArrangedSubview($0)
        }
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).offset(24)
        }
        
        stackView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.top.equalTo(dateLabel.snp.bottom).offset(8)
        }
        
        [locationImageView, shareBtn, refreshBtn].forEach {
            $0.snp.makeConstraints {
                $0.size.equalTo(35)
            }
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom)
            $0.horizontalEdges.bottom.equalTo(view)
        }
    }

    func network() {
        AF.request(WeatherUrl.weatherUrl).responseDecodable(of: WeatherContainer.self) { response in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}
