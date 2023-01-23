//
//  NewsCell.swift
//  News
//
//  Created by Sahassawat on 20/1/2566 BE.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeAndSource: UILabel!
    @IBOutlet weak var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.layer.shadowColor = #colorLiteral(red: 0.431372549, green: 0.431372549, blue: 0.431372549, alpha: 0.12)
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.shadowRadius = 24
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
