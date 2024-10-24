//
//  MVPViewControllerWrapper.swift
//  Architectures_Practice
//
//  Created by 김정윤 on 10/24/24.
//

import UIKit
import SwiftUI

// MVP
// Model - View - Presenter
// Model: 데이터 및 비즈니스 로직 포함
// View: 사용자의 인터페이스를 presenter에 전달하거나 presenter에서 받은 데이터로 UI 업데이트
// Presenter: 뷰와 모델 사이의 중개자, UI 업데이트 및 로직 처리
// 특징: presenter가 view의 상태를 직접 관리!, view는 presenter의 지시에 따라 UI 업데이트
// -> MVVM은 View를 모르지만 MVP의 Presenter는 View를 알고있다?
// - MVC가 1:N이라면 MVP는 하나의 뷰-하나의 프레젠터로 1:1
// - MVI의 차이: Intent 기반의 상태 관리보다는 명령-응답 방식에 중점적

// 장점
// - 프레젠터와 뷰의 구현과의 분리로 테스트 용이
// 단점
// - MVVM보다는 뷰와 프레젠터의 결합이 강함, 프레젠터의 로직이 거대해지면 유지보수가 어려움

// 사용목적: 뷰와 비즈니스 로직의 분리

/*
 과정
 1. 뷰 이벤트 -> 프레젠터
 2. 프레젠터 -> 모델에 데이터 요청
 3. 모델 -> 프레젠터에 응답
 4. 프레젠터 -> 뷰로 데이터 및 작업 결과 전달
 */


// Model: 데이터 구조와 비즈니스 로직
struct CounterModel {
    // 데이터
    // - 외부에서 읽기만 가능
    private(set) var count = 0
    
    // 비즈니스 로직
    mutating func addCount() {
        count += 1
    }
    
    mutating func subCount() {
        count -= 1
    }
}

// Presenter와 View의 상호작용 정의
// Presenter가 View를 업데이트 할 때 사용할 메서드 선언
protocol CounterProtocol: AnyObject {
    func updateCount(_ count: Int) // 카운트 업데이트
}

// Presenter: Model과 View의 중개자
class CounterPresenter {
    private var model: CounterModel // 카운터 상태 관리 모델
    weak var view: CounterProtocol? // View에 대해 약한 참조
    
    init(view: CounterProtocol) {
        self.model = CounterModel()
        self.view = view
    }
    
    // 로직
    // - 카운트 처리 후 View 업데이트
    func addCount() {
        model.addCount()
        view?.updateCount(model.count)
    }
    
    func subCount() {
        model.subCount()
        view?.updateCount(model.count)
    }
}

struct MVPViewControllerWrapper: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        MVPViewController()
    }
}

class MVPViewController: UIViewController, CounterProtocol {
    // Presenter 참조
    private var presenter: CounterPresenter!
    
    private let countLabel = UILabel()
    private let addButton = UIButton(type: .system)
    private let subButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Presenter 초기화 및 View 주입
        presenter = CounterPresenter(view: self)
        updateCount(0) // 초기화
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        countLabel.font = UIFont.systemFont(ofSize: 32)
        countLabel.textAlignment = .center
        
        addButton.setTitle("add", for: .normal)
        addButton.addTarget(self, action: #selector(addBtnTapped), for: .touchUpInside)
        
        subButton.setTitle("sub", for: .normal)
        subButton.addTarget(self, action: #selector(subBtnTapped), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [countLabel, addButton, subButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func addBtnTapped() {
        presenter.addCount()
    }
    
    @objc private func subBtnTapped() {
        presenter.subCount()
    }
    
    // Presenter가 변경된 Count 업데이트 하도록 구성해주는 메서드 
    func updateCount(_ count: Int) {
        countLabel.text = "Count: \(count)"
    }
}

