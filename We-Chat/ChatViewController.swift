//
//  ChatViewController.swift
//  We-Chat
//
//  Created by 许菠菠 on 2017/8/16.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class ChatViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var numberRows = 10
    @IBOutlet weak var ChatTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "微信"
        ChatTableView.delegate = self
        ChatTableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "ChatCell") as! ChatViewCell
        if indexPath.row < numberRows - 1 {
            cell.updateCell(isMoveLine: true)
        }else{
            cell.updateCell(isMoveLine: false)
        }
        return cell
    }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            numberRows -= 1
            tableView.reloadData()

        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detaill = ChatDetaillViewController()
        detaill.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detaill, animated: true)
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
