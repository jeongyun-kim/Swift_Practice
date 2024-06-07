//
//  ChatListViewController.swift
//  TravelTalk
//
//  Created by 김정윤 on 6/1/24.
//

import UIKit

class ChatListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    let list = mockChatList
    var filteredList = mockChatList {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupTableView()
        setupSearchController()
    }
}


// MARK: setupUI
extension ChatListViewController: setupUI {
    func setupNavigation() {
        navigationItem.title = "채팅 목록"
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backButtonTitle = ""
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        let xib = UINib(nibName: ChatListTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: ChatListTableViewCell.identifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
    }
    
    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "친구 이름을 검색해보세요"
    }
}


// MARK: TableViewExtension
extension ChatListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatListTableViewCell.identifier, for: indexPath) as? ChatListTableViewCell else { return UITableViewCell() }
        cell.configureCell(filteredList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = list[indexPath.row]
        let sb = UIStoryboard(name: "ChatRoom", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: ChatRoomViewController.identifier) as! ChatRoomViewController
        vc.ChatRoomData = data
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ChatListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let keyword = searchBar.text else { return }
        if !keyword.isEmpty {
            filteredList = list.filter {
                $0.chatroomName.lowercased().contains(keyword.lowercased())
            }
        } else {
            filteredList = list
        }
    }
}
