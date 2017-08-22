//
//  ChatDetaillViewController.swift
//  We-Chat
//
//  Created by 许菠菠 on 2017/8/17.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class ChatDetaillViewController: UIViewController ,BottomViewDelegate,UITableViewDelegate,UITableViewDataSource{
    var chatDetailTableView : UITableView!
    var chatBottomView : BottomView!
    var dataSouce = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        chatDetailTableView = UITableView.init(frame: self.view.bounds, style: .plain)
        chatDetailTableView.separatorStyle = .none
        chatDetailTableView.backgroundColor = .white
        chatDetailTableView.delegate = self
        chatDetailTableView.dataSource = self
        chatDetailTableView.rowHeight = 55
        chatDetailTableView.register(ChatDetailCell.classForCoder(), forCellReuseIdentifier: "leftCell")
        view.addSubview(chatDetailTableView)
        
        chatBottomView = BottomView(frame:CGRect(x: 0, y:view.bounds.height - 50, width: view.bounds.width, height: 50))
        chatBottomView.myDelegate = self
        view.addSubview(chatBottomView)
        
        // Do any additional setup after loading the view.
    }

    func leftActionClick(typeButton: leftButtonType) {
        print(typeButton)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataSouce.count > 0 {
            return dataSouce.count
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leftCell") as! ChatDetailCell
        if dataSouce.count > 0 {
            let string = dataSouce[indexPath.row]
            cell.updateCell(textString: string)

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       chatBottomView.finishDone()
    }
    
    func sendMessage(sendString: String) {
        print(sendString)
        dataSouce.append(sendString)
        chatDetailTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        chatBottomView.finishDone()

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
