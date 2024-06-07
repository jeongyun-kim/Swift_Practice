//
//  ViewController.swift
//  Practice_TableViewCustomSwipe
//
//  Created by 김정윤 on 5/27/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SystemCell")!
        cell.textLabel?.text = "\(indexPath.row)번"
        return cell
    }
    
    // 테이블뷰 셀 왼쪽에서 오른쪽으로 밀었을 때 삭제, 햅삐 버튼 나오기 <- UITableViewDelegate
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // UIContextualAction : 테이블뷰 스와이프 했을 때의 액션
        let delete = UIContextualAction(style: .destructive, title: "삭제") { _, _, _ in
            print("삭제!")
        }
        let happy = UIContextualAction(style: .destructive, title: "햅삐✨") { _, _, _ in
            print("햅삐!")
        }
        happy.backgroundColor = .systemYellow
        // UISwipeActionsConfiguration : 스와이프 했을 때 튀어나올 액션들
        // actions에 넣어준 순서대로 보여짐
        return UISwipeActionsConfiguration(actions: [delete, happy])
    }
    
    // 테이블뷰 셀 오른쪽에서 왼쪽으로 밀었을 때 확인 버튼 나오기
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // 액션
        let confirm = UIContextualAction(style: .normal, title: "확인") { _, _, _ in
            print("확인!")
        }
        confirm.backgroundColor = .systemBlue
        return UISwipeActionsConfiguration(actions: [confirm])
    }
}
