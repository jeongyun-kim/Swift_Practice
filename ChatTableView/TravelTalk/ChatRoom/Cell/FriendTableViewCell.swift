//
//  FriendTableViewCell.swift
//  TravelTalk
//
//  Created by 김정윤 on 6/2/24.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var friendChatLabel: UILabel!
    @IBOutlet var friendChatView: UIView!
    @IBOutlet var friendNameLabel: UILabel!
    @IBOutlet var friendImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    private func configureLayout() {
        friendChatView.configureChatView()
        friendChatLabel.configureChatLabel()
        friendNameLabel.font = UIFont.systemFont(ofSize: 14)
        friendImageView.configureProfileImageView()
        self.selectionStyle = .none
        dateLabel.descText()
    }
    
    func configureCell(_ data: Chat) {
        friendImageView.image = UIImage(named: data.user.profileImage)
        
        friendNameLabel.text = data.user.rawValue
        
        friendChatLabel.text = data.message
        
        dateLabel.text = data.dateFormatted()
    }
}
