//
//  UserTableViewCell.swift
//  TravelTalk
//
//  Created by 김정윤 on 6/2/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet var messageView: UIView!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    private func configureLayout() {
        messageLabel.configureChatLabel()
        messageView.configureChatView()
        dateLabel.descText()
        self.selectionStyle = .none
    }
    
    func configureCell(_ data: Chat) {
        dateLabel.text = data.dateFormatted()
        messageLabel.text = data.message
    }
}
