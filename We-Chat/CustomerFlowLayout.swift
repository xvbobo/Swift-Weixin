//
//  CustomerFlowLayout.swift
//  We-Chat
//
//  Created by 许菠菠 on 2017/8/29.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class CustomerFlowLayout: UICollectionViewFlowLayout {
    private let widthItem = (UIScreen.main.bounds.width - 40)/3
    override init() {
        super.init()
        self.scrollDirection = .vertical;
        self.itemSize = CGSize.init(width: widthItem, height: widthItem)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
