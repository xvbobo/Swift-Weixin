//
//  DiscoverViewController.swift
//  We-Chat
//
//  Created by 许菠菠 on 2017/8/16.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var myCollectionView: UICollectionView!
    private var collectionLayout : CustomerFlowLayout!
    private let widthItem = (UIScreen.main.bounds.width - 40)/3
    private var dataSource = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionLayout = CustomerFlowLayout()
        myCollectionView.setCollectionViewLayout(collectionLayout, animated: false)
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.backgroundColor = .black
        myCollectionView.register(UINib.init(nibName: "DiscoverCell", bundle: nil), forCellWithReuseIdentifier: "discover")
        dataSource = ["1","2","3","4","5","6","7","8","9"]
        //添加长按手势为了移动Item
        let longPress = UILongPressGestureRecognizer.init(target: self, action: #selector(longPressAction))
        myCollectionView.addGestureRecognizer(longPress)
        // Do any additional setup after loading the view.
    }

    func longPressAction(longPress:UILongPressGestureRecognizer) {
        switch longPress.state {
        case .began:
            //获取开始移动的Item
            let indexPath = self.myCollectionView .indexPathForItem(at: longPress.location(in: self.myCollectionView))
            if indexPath == nil {
                return
            }
            self.myCollectionView.beginInteractiveMovementForItem(at: indexPath!)
            break
        case .changed:
            //移动过程中更新Item的位置
            self.myCollectionView .updateInteractiveMovementTargetPosition(longPress.location(in: self.myCollectionView))
            break
        case .ended:
            self.myCollectionView.endInteractiveMovement()
            break
        default:
            self.myCollectionView.cancelInteractiveMovement()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "discover", for: indexPath) as! DiscoverCell
        if dataSource.count > 0 && dataSource.count>indexPath.section * 3 + indexPath.item{
            cell.nameLable.isHidden = false

            let string = dataSource[indexPath.row]
            cell.nameLable.text = string
        }else{
            cell.nameLable.isHidden = true
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item,indexPath.section*3 + indexPath.item)
        
    }
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let string = dataSource[sourceIndexPath.item]
        //移除你选中的item
        dataSource.remove(at:sourceIndexPath.item)
        //将选中的item重新插入数据源
        dataSource.insert(string, at: destinationIndexPath.item)
        self.myCollectionView.reloadData()
        
    }
    
    
    @IBAction func addActionButton(_ sender: UIBarButtonItem) {
        let detaillVC = DiscoverDetaillController()
        detaillVC.discoverBlock = { string in
            self.dataSource.append(string)
            self.myCollectionView.reloadData()
        }
        self.navigationController?.pushViewController(detaillVC, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
