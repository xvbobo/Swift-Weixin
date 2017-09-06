//
//  AddressBookViewController.swift
//  We-Chat
//
//  Created by 许菠菠 on 2017/8/16.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit
import ContactsUI
class AddressBookViewController: BaseViewController,CNContactPickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addFirends(_ sender: UIBarButtonItem) {
        let pickerVC = CNContactPickerViewController()
        pickerVC.delegate = self
        self.present(pickerVC, animated: true, completion: nil)
    }

   
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        print(contact.familyName + contact.givenName)
        for i in contact.phoneNumbers {
            
            let phoneNum = i.value.stringValue //电话号码
            print(phoneNum)
        }
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
