//
//  ShoppingTableViewCell.swift
//  TableView0524
//
//  Created by 김정윤 on 5/31/24.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    @IBOutlet var cellView: UIView!
    @IBOutlet var starBtn: UIButton!
    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var checkBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    func configureLayout() {
        cellView.backgroundColor = .systemGray6
        cellView.layer.cornerRadius = 8
        
        starBtn.setImage(UIImage(systemName: "star"), for: .normal)
        starBtn.tintColor = .black
        
        checkBtn.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        checkBtn.tintColor = .black
    }
    
    func configureCell(_ data: ToBuy) {
        let checkImage = data.complete ? "checkmark.square.fill" : "checkmark.square"
        checkBtn.setImage(UIImage(systemName: checkImage), for: .normal)
        
        let starImage = data.importance ? "star.fill" : "star"
        starBtn.setImage(UIImage(systemName: starImage), for: .normal)
        
        itemLabel.text = data.toBuy
    }
}
