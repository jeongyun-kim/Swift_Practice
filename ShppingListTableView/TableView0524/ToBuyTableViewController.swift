//
//  TodoTableViewController.swift
//  TableView0524
//
//  Created by 김정윤 on 5/24/24.
//

import UIKit

class ToBuyTableViewController: UITableViewController {

    var toBuyList: [ToBuy] = []
    
    @IBOutlet var addView: UIView!
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // 키보드의 return키에 액션주기위해
        addTextField.delegate = self
        tableView.rowHeight = 55
        addBtn.addTarget(self, action: #selector(addBtnTapped), for: .touchUpInside)
    }

    func setupUI() {
        tableView.keyboardDismissMode = .onDrag
        addBtn.designAddBtn(title: "추가")
        addTextField.designAddTextField()
        addView.designAddView()
    }
  
    // 테이블뷰의 셀의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toBuyList.count
    }
    
    // 테이블뷰 내 셀 디자인
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToBuyCell", for: indexPath) as? ToBuyCell else { return UITableViewCell() }
        let data = toBuyList[indexPath.row]
        let completeImage = data.complete ? "checkmark.square.fill" : "checkmark.square"
        let importance = data.importance ? "star.fill" : "star"
        
        cell.toBuyLabel.text = data.toBuy
        cell.toBuyLabel.font = UIFont.systemFont(ofSize: 15)
        
        cell.completeBtn.setImage(UIImage(systemName: completeImage), for: .normal)
        cell.completeBtn.tintColor = .black
        cell.completeBtn.tag = indexPath.row
        cell.completeBtn.addTarget(self, action: #selector(completeBtnTapped), for: .touchUpInside)
        
        cell.importanceBtn.setImage(UIImage(systemName: importance), for: .normal)
        cell.importanceBtn.tintColor = .black
        cell.importanceBtn.tag = indexPath.row
        cell.importanceBtn.addTarget(self, action: #selector(importanceBtnTapped), for: .touchUpInside)
        
        cell.cellView.backgroundColor = .systemGray6
        cell.cellView.layer.cornerRadius = 10
        return cell
    }


    // 추가 버튼 눌렀을 때 + 키보드 return으로 입력했을 경우
    @objc func addBtnTapped(_ sender: UIButton) {
        // 텍스트필드에 입력한 텍스트가 공백을 제거하고 1글자 이상인지 확인하기
        // - 1글자 이상이라면 해당 항목이 존재하는지 확인하기
        //  - 같은 항목이 존재한다면 알림창 띄우기
        //  - 같은 항목이 존재하지 않는다면 list에 append
        // - 1글자 미만이라면 알림창 띄우기 -> 구매할 물건을 입력해주세요!
        guard let toBuy = addTextField.text, toBuy.components(separatedBy: " ").joined().count >= 1 else {
            return showAlert(title: "구매할 물건을 입력해주세요!", style: .alert)}
        
        // toBuyList에 이미 해당 이름의 항목이 존재한다면
        if toBuyList.filter({ item in
            item.toBuy == toBuy
        }).count == 1 {
            showAlert(title: "이미 같은 항목이 존재해요!", style: .alert)
        } else {
            let toBuyItem = ToBuy(toBuy: toBuy, complete: false, importance: false)
            toBuyList.append(toBuyItem)
            addTextField.text = ""
            tableView.reloadData()
        }
    }
    
    // 체크 표시
    @objc func completeBtnTapped(_ sender: UIButton) {
        toBuyList[sender.tag].complete.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    // 별표 표시
    @objc func importanceBtnTapped(_ sender: UIButton) {
        toBuyList[sender.tag].importance.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
}

// return키 눌렀을 때 키보드는 안 내리고 list에 항목 추가하기
extension ToBuyTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addBtnTapped(addBtn)
        return true
    }
}
