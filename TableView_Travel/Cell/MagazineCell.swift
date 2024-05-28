//
//  MagazineCell.swift
//  TableView_Travel
//
//  Created by 김정윤 on 5/25/24.
//

import UIKit
import Kingfisher

class MagazineCell: UITableViewCell {
    @IBOutlet var magazineDateLabel: UILabel!
    @IBOutlet var magazineSubTitleLabel: UILabel!
    @IBOutlet var magazineImageView: UIImageView!
    @IBOutlet var magazineTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    func configureLayout() {
        magazineTitleLabel.setTitleLabel(size: 18)
        magazineTitleLabel.numberOfLines = 2
        
        magazineSubTitleLabel.setDescLabel(size: 15, color: .gray)
    
        magazineDateLabel.setDescLabel(size: 13, color: .gray)
        
        magazineImageView.contentMode = .scaleAspectFill
        magazineImageView.layer.cornerRadius = 12
    }
    
    func configureCell(_ data: Magazine) {
        magazineTitleLabel.text = data.title
        magazineSubTitleLabel.text = data.subtitle
        let url = URL(string: data.photo_image)
        magazineImageView.kf.setImage(with: url)
        magazineDateLabel.text = data.formattedDate
    }
}
