//
//  Extensions.swift
//  TableView0524
//
//  Created by 김정윤 on 5/24/24.
//

import UIKit

extension UIButton {
    // 헤더의 추가버튼 디자인
    func designAddBtn(title: String) {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.tintColor = .black
        self.layer.cornerRadius = 8
        self.layer.backgroundColor = UIColor.systemGray5.cgColor
    }
}

extension UIView {
    // 헤더의 텍스트필드, 버튼을 포함하는 뷰
    func designAddView() {
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 10
    }
}

extension UITextField {
    // 헤더의 텍스트필드 디자인
    func designAddTextField() {
        self.borderStyle = .none
        self.backgroundColor = .systemGray6
        self.attributedPlaceholder = NSAttributedString(string: "무엇을 구매하실건가요?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.gray.cgColor])
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        self.leftViewMode = .always
    }
}

extension UIViewController {
    func showAlert(title: String? = nil, message: String? = nil, style: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let confirm = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(confirm)
        present(alert, animated: true)
    }
}
