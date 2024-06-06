//
//  WeatherTableViewCell.swift
//  NetworkPractice
//
//  Created by 김정윤 on 6/6/24.
//

import UIKit
import SnapKit

class WeatherTableViewCell: UITableViewCell {
    let view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Layer.cornerRadius
        view.backgroundColor = .white
        return view
    }()
    
    let chatLabel: UILabel = {
        let label = UILabel()
        label.font = Font.chatFont
        label.text = "지금은 5시 55분"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        contentView.addSubview(view)
        view.addSubview(chatLabel)
    }
    
    private func setupConstraints() {
        view.snp.makeConstraints {
            $0.verticalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(12)
            $0.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(24)
        }
        
        chatLabel.snp.makeConstraints {
            $0.edges.equalTo(view).inset(8)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
