//
//  ChatListTableViewCell.swift
//  TravelTalk
//
//  Created by 김정윤 on 6/1/24.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {
    @IBOutlet var fourUserImagesCollections: [UIImageView]!
    @IBOutlet var userImageViewForFour: UIView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var chatRoomLabel: UILabel!
    @IBOutlet var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    private func configureLayout() {
        chatRoomLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        chatLabel.font = UIFont.systemFont(ofSize: 14)
        chatLabel.textColor = .gray
        userImageView.configureProfileImageView()
        dateLabel.descText()
        fourUserImagesCollections.forEach { imageView in
            imageView.configureProfileImageView()
        }
        self.selectionStyle = .none
    }
    
    func configureCell(_ data: ChatRoom) {
        if data.chatroomImage.count == 4 {
            userImageViewForFour.isHidden = false
            userImageView.isHidden = true
            for (idx, image) in data.chatroomImage.enumerated() {
                fourUserImagesCollections[idx].image = UIImage(named: image)
            }
        } else {
            userImageViewForFour.isHidden = true
            userImageView.isHidden = false
            userImageView.image = UIImage(named: data.chatroomImage[0])
        }
        
        chatRoomLabel.text = data.chatroomName
        
        chatLabel.text = data.chatList.last?.message
        
        dateLabel.text = data.lastDate
    }
}
