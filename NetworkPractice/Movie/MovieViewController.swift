//
//  MovieViewController.swift
//  Network_0605
//
//  Created by 김정윤 on 6/5/24.
//

import UIKit
import Alamofire
import SnapKit
import Toast

class MovieViewController: UIViewController, setup {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        let attributedPlaceholder = NSAttributedString(string: "'20210101' 과 같은 형식으로 검색해주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: Font.descFont])
        textField.attributedPlaceholder = attributedPlaceholder
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.borderStyle = .none
        textField.keyboardType = .numberPad
        textField.tintColor = .white
        return textField
    }()

    let border: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let searchBtn: UIButton = {
        let button = UIButton()
        button.setTitle("검색", for: .normal)
        button.titleLabel?.font = Font.descFont
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    var list: [Movie] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    // MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
        setupHierarchy()
        setupConstraints()
        addTargets()
        network()
    }
    
    func setupHierarchy() {
        view.addSubview(searchTextField)
        view.addSubview(border)
        view.addSubview(tableView)
        view.addSubview(searchBtn)
    }
    
    func setupConstraints() {
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(35)
        }
        
        border.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom)
            $0.horizontalEdges.equalTo(searchTextField)
            $0.height.equalTo(2)
        }
        
        searchBtn.snp.makeConstraints {
            $0.leading.equalTo(searchTextField.snp.trailing).offset(8)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.bottom.equalTo(border.snp.bottom)
            $0.width.equalTo(view.snp.width).multipliedBy(0.1)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(border.snp.bottom)
            $0.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 50
        
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
    
    func setupUI() {
        view.backgroundColor = .lightGray
        tableView.backgroundColor = .lightGray
    }
    
    func addTargets() {
        searchTextField.addTarget(self, action: #selector(textFieldDidEditingBegin), for: .editingDidBegin)
        searchTextField.addTarget(self, action: #selector(textFieldDidEditingEnd), for: .editingDidEnd)
        searchBtn.addTarget(self, action: #selector(searchBtnTapped), for: .touchUpInside)
    }
    
    // MARK: Action
    // 입력 시작하면 placeHolder 지우기
    @objc func textFieldDidEditingBegin(_ sender: UITextField) {
        searchTextField.placeholder = ""
    }
    
    // 입력이 끝났는데, 아무것도 입력하지 않았다면 placeHolder 다시 세팅하기
    @objc func textFieldDidEditingEnd(_ sender: UITextField) {
        if searchTextField.text!.isEmpty {
            searchTextField.placeholder = "'20210101' 과 같은 형식으로 검색해주세요"
        }
    }
    
    // MARK: Search(Network/DataCheck)
    @objc func searchBtnTapped(_ sender: UIButton) {
        view.endEditing(true)
        guard let keyword = searchTextField.text else { return }
        //  - 년도 / 월 / 일 제대로 입력했는지 확인하기
        if !keyword.isEmpty {
            let cnt = keyword.components(separatedBy: " ").joined().count
            if cnt == 8 && checkDate(keyword){
                print("검색가보자궁🚀")
                MovieUrl.movieUrl = keyword
                network()
            } else {
                self.showToast("입력값을 확인해주세요!")
            }
        } else {
            self.showToast("검색할 날을 입력해주세요!")
        }
    }
    
    private func checkDate(_ keyword: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMdd"
        guard let inputDate = dateFormatter.date(from: keyword) else { return false }
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        let result: ComparisonResult = inputDate.compare(yesterday!)
        // -1 : 과거 / 1 미래
        // - 미래 데이터는 존재하지 않으므로 false 처리로 사용자에게 데이터 입력 토스트 띄우기
        // - 과거 데이터는 일단 검색 후, 받아오는 데이터가 비어있다면 검색결과 없다는 토스트 띄우기
        return result.rawValue == -1 ? true : false
    }
    
    private func network() {
        AF.request(MovieUrl.movieUrl).responseDecodable(of: BoxOffice.self) { response in
            switch response.result {
            case .success(let value):
                print("success")
                let data = value.boxOfficeResult.dailyBoxOfficeList
                if data.isEmpty {
                    self.showToast("검색결과가 없어요!")
                } else {
                    self.list = data
                }
            case .failure(let error):
                print(error)
                
            }
        }
    }
}

// MARK: TableViewExtension
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
