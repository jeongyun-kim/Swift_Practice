//
//  ShoppingViewController.swift
//  TableView0524
//
//  Created by 김정윤 on 5/31/24.
//

import UIKit

class ShoppingViewController: UIViewController {
    @IBOutlet var addView: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var addBtn: UIButton!
    @IBOutlet var addTextField: UITextField!
    
    var list: [ToBuy] = [
        ToBuy(toBuy: "🍎", complete: false, importance: false),
        ToBuy(toBuy: "⭐️", complete: false, importance: false)
    ] {
        didSet { // list가 변할 때마다 tableView reload
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
    }
    
}


// MARK: UI 세팅
extension ShoppingViewController {
    func setupUI() {
        addTextField.borderStyle = .none
        addTextField.backgroundColor = .systemGray6
        let attributedPlaceholder = NSAttributedString(string: "무엇을 구매하실건가요?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        addTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        addTextField.leftViewMode = .always
        addTextField.attributedPlaceholder = attributedPlaceholder
        
        addView.backgroundColor = .systemGray6
        addView.layer.cornerRadius = 10
        
        addBtn.setTitle("추가", for: .normal)
        addBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        addBtn.tintColor = .black
        addBtn.layer.cornerRadius = 8
        addBtn.backgroundColor = .systemGray5
    }
    
    func setupNavigation() {
        navigationItem.title = "쇼핑 목록"
    }
    
    func setupTableView() {
        let xib = UINib(nibName: ShoppingTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: ShoppingTableViewCell.identifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: TableView Extension
extension ShoppingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.identifier, for: indexPath) as? ShoppingTableViewCell else { return UITableViewCell() }
        cell.configureCell(list[indexPath.row])
        cell.checkBtn.tag = indexPath.row
        cell.checkBtn.addTarget(self, action: #selector(checkBtnTapped), for: .touchUpInside)
        cell.starBtn.tag = indexPath.row
        cell.starBtn.addTarget(self, action: #selector(starBtnTapped), for: .touchUpInside)
        return cell
    }
}

// MARK: Action
extension ShoppingViewController {
    @objc func checkBtnTapped(_ sender: UIButton) {
        list[sender.tag].complete.toggle()
    }
    
    @objc func starBtnTapped(_ sender: UIButton) {
        list[sender.tag].importance.toggle()
    }
    
    @IBAction func addBtnTapped(_ sender: UIButton) {
        guard let text = addTextField.text else { return }
        if text.components(separatedBy: " ").joined().count > 0 {
            list.append(ToBuy(toBuy: text, complete: false, importance: false))
        }
    }
}
