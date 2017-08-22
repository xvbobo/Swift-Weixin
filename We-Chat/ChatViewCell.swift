//
//  ChatViewCell.swift
//  We-Chat
//
//  Created by 许菠菠 on 2017/8/17.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class ChatViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lineImageView: UIImageView!
    @IBOutlet weak var headerImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.headerImage.layer.masksToBounds = true
        self.headerImage.layer.cornerRadius = 5;

    }
    func updateCell(isMoveLine: Bool)  {
        if isMoveLine == true {
            lineImageView.frame = CGRect(x: 20, y: lineImageView.frame.origin.y, width: lineImageView.frame.width, height: 0.5)

        }else{
            lineImageView.frame = CGRect(x:0, y: lineImageView.frame.origin.y, width: lineImageView.frame.width, height: 0.5)

        }
        nameLabel.text = "微信团队"
//        if nameLabel.text == "微信团队" {
//            nameLabel.textColor = .blue
//        }
        contentLabel.text = "欢迎你再次回到微信。如果你在使用过程中有任何的问题或建议，记得给我发信反馈哦。"
    }
//    override func layoutSubviews() {
//
//    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
