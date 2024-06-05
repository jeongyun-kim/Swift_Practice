//
//  MovieTableViewCell.swift
//  Network0605
//
//  Created by 김정윤 on 6/5/24.
//

import UIKit
import SnapKit

class MovieTableViewCell: UITableViewCell {
    let view: UIView = {
        let view = UIView()
        return view
    }()
    
    let rankLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
        contentView.backgroundColor = .systemGray4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierarchy() {
        contentView.addSubview(rankLabel)
    }
    
    private func configureLayout() {
        rankLabel.snp.makeConstraints {
            $0.width.equalTo(contentView.snp.width).multipliedBy(0.11)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide).offset(16)
            $0.centerY.equalTo(contentView.safeAreaLayoutGuide)
            $0.height.equalTo(30)
        }
    }
}
