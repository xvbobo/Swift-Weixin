//
//  UserInfoViewController.swift
//  We-Chat
//
//  Created by 许菠菠 on 2017/8/16.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class UserInfoViewController: BaseViewController {

    private var myView : CustomerAnimationView!
    private var pictueView : PictureView!

    override func viewDidLoad() {
        super.viewDidLoad()
        myView = CustomerAnimationView(frame:CGRect(x:(UIScreen.main.bounds.width - 200)/2,y:100,width:200,height:200))
//        view.addSubview(myView)
        
        pictueView = PictureView(frame:CGRect(x:0,y:64,width:320,height:320))
        view.addSubview(pictueView)
        // Do any additional setup after loading the view.
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
