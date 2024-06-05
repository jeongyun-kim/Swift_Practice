//
//  MovieViewController.swift
//  Network_0605
//
//  Created by 김정윤 on 6/5/24.
//

import UIKit
import Alamofire
import SnapKit

class MovieViewController: UIViewController {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()
    
    var list: [Movie] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
        setupHierarchy()
        setupConstraints()
        network()
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 50
        
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
    
    private func setupUI() {
        view.backgroundColor = .lightGray
        tableView.backgroundColor = .lightGray
    }
    
    private func network() {
        AF.request(MovieUrl.movieUrl).responseDecodable(of: BoxOffice.self) { response in
            switch response.result {
            case .success(let value):
                print("success")
                self.list = value.boxOfficeResult.dailyBoxOfficeList
            case .failure(let error):
                print(error)
            }
        }
    }
}


extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        let movieData = list[indexPath.row]
        cell.configureCell(movieData)
        return cell
    }
}
