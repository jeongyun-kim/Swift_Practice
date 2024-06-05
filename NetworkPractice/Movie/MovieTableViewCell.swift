//
//  MovieTableViewCell.swift
//  Network_0605
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
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
        contentView.backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierarchy() {
        contentView.addSubview(rankLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(titleLabel)
        
    }
    
    private func configureLayout() {
        rankLabel.snp.makeConstraints {
            $0.width.equalTo(contentView.snp.width).multipliedBy(0.1)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide).offset(16)
            $0.centerY.equalTo(contentView.safeAreaLayoutGuide)
            $0.height.equalTo(25)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.trailing).offset(8)
            $0.centerY.equalTo(contentView.safeAreaLayoutGuide)
            $0.trailing.equalTo(dateLabel.snp.leading).offset(-8)
        }
        
        dateLabel.snp.makeConstraints {
            $0.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            $0.centerY.equalTo(contentView)
            $0.width.equalTo(contentView.snp.width).multipliedBy(0.2)
        }
    }
    
    func configureCell(_ data: Movie) {
        rankLabel.text = data.rank
        titleLabel.text = data.movieNm
        dateLabel.text = data.openDt
    }
}

