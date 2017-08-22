//
//  ChatDetailCell.swift
//  We-Chat
//
//  Created by 许菠菠 on 2017/8/17.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class ChatDetailCell: UITableViewCell {

    private var contentLable:UILabel!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        self.selectionStyle = .none
        contentLable = UILabel(frame:CGRect(x: 0,y:0,width:UIScreen.main.bounds.width,height:frame.height))
        contentLable.textColor = .gray
        contentLable.font = UIFont.systemFont(ofSize: 13)
        contentLable.numberOfLines = 0
        self.addSubview(contentLable)
    }
    
    func updateCell(textString:String) {
        contentLable.text = textString
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
