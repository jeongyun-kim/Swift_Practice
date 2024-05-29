//
//  PopularCityViewController.swift
//  TableView_Travel
//
//  Created by 김정윤 on 5/29/24.
//

import UIKit

class PopularCityViewController: UIViewController {
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    let popularCityList = CityInfo.city
    
    var filteredCityList: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSegmentControl()
        filteredCityList = popularCityList
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let popularCityXib = UINib(nibName: PopularCityTableViewCell.identifier, bundle: nil)
        tableView.register(popularCityXib, forCellReuseIdentifier: PopularCityTableViewCell.identifier)
        // 폰 스크린 높이의 0.2를 높이로
        tableView.rowHeight = UIScreen.main.bounds.height * 0.2
        tableView.separatorStyle = .none
    }
    
    func setupSegmentControl() {
        let segmentTitles = ["모두", "국내", "해외"]
        let attribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .bold)]
        
        let korean = popularCityList.filter { $0.domestic_travel }
        let foreign = popularCityList.filter { !$0.domestic_travel }
        let segmentActions = [popularCityList, korean, foreign]
        
        // 왜 액션이랑 타이틀 둘의 순서가 바뀌면 타이틀이 안 나오지?ㅅ?
        for i in (0..<segmentTitles.count) {
            segmentControl.setAction(UIAction(handler: { _ in
                // 필터링 리스트에 필터링 반영
                self.filteredCityList = segmentActions[i]
                // 선택한 세그먼트는 폰트 굵게 변경
                self.segmentControl.setTitleTextAttributes(attribute, for: .selected)
                // 테이블뷰 다시 불러오기
                self.tableView.reloadData()
            }), forSegmentAt: i)
            // 각 세그먼트에 제목 넣어주기
            segmentControl.setTitle(segmentTitles[i], forSegmentAt: i)
            // 디폴트로 선택되어있는 곳에는 폰트 굵게
            segmentControl.setTitleTextAttributes(attribute, for: .selected)
        }
    }
}


extension PopularCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularCityTableViewCell.identifier, for: indexPath) as? PopularCityTableViewCell else { return UITableViewCell() }
        cell.configureCell(filteredCityList[indexPath.row])
        return cell
    }
}
