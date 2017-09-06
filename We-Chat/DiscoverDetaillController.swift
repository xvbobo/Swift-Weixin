//
//  DiscoverDetaillController.swift
//  We-Chat
//
//  Created by 许菠菠 on 2017/8/29.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit
typealias TextBlock = (String)->()
class DiscoverDetaillController: UIViewController,UITextFieldDelegate {

    private var myTextField: UITextField!
    private var doneButton: UIButton!
    var discoverBlock : TextBlock!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        myTextField = UITextField(frame: CGRect(x: 25,y: 100,width: UIScreen.main.bounds.width - 50,height:45))
        myTextField.placeholder = "请输入少于4个字的标题"
        myTextField.borderStyle = .roundedRect
        myTextField.delegate = self
        view.addSubview(myTextField)
        doneButton = UIButton(type: .custom)
        doneButton.frame = CGRect(x:(UIScreen.main.bounds.width - 100)/2,y:myTextField.frame.origin.y + myTextField.frame.size.height + 10, width: 100, height: 50)
        doneButton.layer.masksToBounds = true
        doneButton.layer.cornerRadius = 5
        doneButton.setTitle("完成", for: .normal)
        doneButton.setTitleColor(.white, for: .normal)
        doneButton.backgroundColor = .blue
        doneButton.addTarget(self, action: #selector(doneButtonAction(_:)), for: .touchUpInside)
        view.addSubview(doneButton)
        
        // Do any additional setup after loading the view.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text?.lengthOfBytes(using: .utf8))! > 4{
            return false
        }
        return true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myTextField.becomeFirstResponder()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        myTextField.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doneButtonAction(_ sender: UIButton) {
        if (myTextField.text?.lengthOfBytes(using: .utf8))! > 0 {
            discoverBlock(myTextField.text!)
        }
        self.navigationController?.popViewController(animated: true)
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
