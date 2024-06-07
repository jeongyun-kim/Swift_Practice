//
//  ChatRoomViewController.swift
//  TravelTalk
//
//  Created by 김정윤 on 6/2/24.
//

import UIKit

class ChatRoomViewController: UIViewController {

    @IBOutlet var textView: UIView!
    @IBOutlet var sendBtn: UIButton!
    @IBOutlet var textField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    var ChatRoomData: ChatRoom?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
        setupKeyboardEvent()
        setupUI()
        scrollToBottom()
    }
}

// MARK: UI
extension ChatRoomViewController: setupUI {
    func setupNavigation() {
        navigationItem.title = ChatRoomData?.chatroomName
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let userXib = UINib(nibName: UserTableViewCell.identifier, bundle: nil)
        tableView.register(userXib, forCellReuseIdentifier: UserTableViewCell.identifier)
        let friendXib = UINib(nibName: FriendTableViewCell.identifier, bundle: nil)
        tableView.register(friendXib, forCellReuseIdentifier: FriendTableViewCell.identifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
    }
    
    func setupKeyboardEvent() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setupUI() {
        textView.backgroundColor = .systemGray6
        textView.layer.cornerRadius = 10
        
        textField.placeholder = "메세지를 입력하세요"
        textField.backgroundColor = .systemGray6
        textField.borderStyle = .none
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 10
        
        sendBtn.tintColor = .lightGray
        sendBtn.backgroundColor = .systemGray6
    }
}

// MARK: TableViewExtension
extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let chatRoomData = ChatRoomData else { return 0 }
        return chatRoomData.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let chat = ChatRoomData?.chatList[indexPath.row] else { return UITableViewCell() }
        
        if chat.user == .user {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell else { return UITableViewCell() }
            cell.configureCell(chat)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
            cell.configureCell(chat)
            return cell
        }
    }
}

// MARK: Action(keyboard, scrollToBottom)
extension ChatRoomViewController {
    // 키보드가 올라왔을 때
    @objc func keyboardWillShow(_ sender: Notification) {
        // 키보드의 frame을 받아오기
        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        // 키보드의 높이값
        let keyboardHeight = keyboardFrame.cgRectValue.height

        // 현재 뷰가 바닥에 붙어있다면 키보드 높이만큼 올리기
        if view.frame.origin.y == 0 {
            view.frame.origin.y -= keyboardHeight
        }
    }

    // 키보드가 사라졌을 때
    @objc func keyboardWillHide(_ sender: Notification) {
        if view.frame.origin.y != 0 { // 뷰의 위치가 바닥이 아니라면 바닥(0)으로
            view.frame.origin.y = 0
        }
    }
    
    // 테이블뷰의 마지막 셀로 스크롤 내리기
    func scrollToBottom(){
        DispatchQueue.main.async {
            // 채팅방의 채팅 개수
            guard let cnt = self.ChatRoomData?.chatList.count else { return }
            // 채팅 개수가 0보다 많다면
            if cnt > 0 {
                // idx -> 마지막 채팅의 행 구하기
                let idx = IndexPath(row: cnt-1, section: 0)
                // 테이블뷰를 마지막행으로 이동시키기
                // - animated는 false로 해줘야 스크롤이 내려가는게 안 보임
               self.tableView.scrollToRow(at: idx, at: .bottom, animated: false)
            }
        }
    }
}
