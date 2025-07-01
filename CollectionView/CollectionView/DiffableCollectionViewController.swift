//
//  DiffableCollectionViewController.swift
//  CollectionView
//
//  Created by 김정윤 on 7/1/25.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

struct Cookie: Hashable {
    let id: UUID = UUID()
    let name: String
    let price: Int
}

final class DiffableCollectionViewController: UIViewController {
    init(vm: ViewModel = ViewModel()) {
        super.init(nibName: nil, bundle: nil)
        self.vm = vm
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var vm: ViewModel!
    let disposeBag = DisposeBag()
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: .cookieLayout())
        return cv
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setImage(.add, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    enum Section: Hashable, CaseIterable {
        case main
    }
    
    typealias Item = Cookie
    
    // CollectionViewDataSource
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    // CellRegistration
    private var registration: UICollectionView.CellRegistration<UICollectionViewListCell, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(button)
        view.addSubview(collectionView)
        
        button.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.size.equalTo(40)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom)
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        configureCollectionView()
        updateSnapshot()
        bind()
    }
    
    private func configureCollectionView() {
        registration = UICollectionView.CellRegistration<UICollectionViewListCell, Item> { cell, indexPath, item in
            var content = UIListContentConfiguration.valueCell()
            content.text = item.name
            content.secondaryText = "\(item.price)"
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { [weak self] collectionView, indexPath, item in
            guard let self else { return UICollectionViewCell() }
            let cell = collectionView.dequeueConfiguredReusableCell(using: self.registration, for: indexPath, item: item)
            return cell
        }
    }
    
    private func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(vm.list, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
//    @objc private func buttonTapped(_ sender: UIButton) {
//        let newCookie = Cookie(name: "집가고싶어", price: 0)
//        list.append(newCookie)
//        updateSnapshot()
//    }
    
    private func bind() {
        let addBtnTapped = button.rx.tap
        let input = ViewModel.Input(addBtnTapped: addBtnTapped)
        let output = vm.transform(input)
        
        output.alert
            .asSignal()
            .emit(with: self) { owner, _ in
                owner.updateSnapshot()
            }
            .disposed(by: disposeBag)
    }
}

//extension DiffableCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: list[indexPath.item])
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list.count
//    }
//}
