//
//  BottomView.swift
//  We-Chat
//
//  Created by 许菠菠 on 2017/8/17.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

protocol BottomViewDelegate : NSObjectProtocol {
    func leftActionClick(typeButton:leftButtonType)
    func sendMessage(sendString:String)
}

enum leftButtonType {
    case Voice //语音
    case Write //文字
    case Smile //笑脸
    case Open  //笑脸
    case Close //笑脸
}


class BottomView: UIView ,UITextViewDelegate{
    
    
    
    weak var myDelegate:BottomViewDelegate!
    var hiddenKeyboard : Bool!
    
    private var oldTextViewHeight = 0
    private var newTextViewHeight = 0
    private var frameY : CGFloat!
    private var view1 : UIView!
    private var view2 : UIView!
    private var textView : UITextView!
    private var showKey : Bool!
    private var smileButton : UIButton!
    private var voiceButton : UIButton!
    
    override var inputAccessoryView: UIView?{
        get {
            if view1 == nil {
                view1 = self.getCustomerView1()
            }
            return view1
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        view2 = UIView(frame: CGRect(x:0,y:0,width:frame.width,height: 200))
        view2.backgroundColor = .red
        self.becomeFirstResponder()
        
    }
    
    func getCustomerView1() -> UIView {
        let view1 = UIView(frame: self.bounds)
        view1.backgroundColor = .white
        voiceButton = self.getAButton(title: "语音", frame: CGRect(x: 10, y: 5, width: frame.height - 10, height: frame.height - 10), backColor: .red,nomalImage: "liaotian_ic_yuyin_nor",selectImage:"liaotian_ic_jianpan_nor")
        voiceButton.addTarget(self, action: #selector(leftButtonAction), for: .touchUpInside)
        view1.addSubview(voiceButton)
        
        smileButton = self.getAButton(title: "笑脸", frame: CGRect(x: frame.width - (frame.height - 10) * 2 - 20, y: 5, width: frame.height - 10, height: frame.height - 10), backColor: .red,nomalImage: "liaotian_ic_biaoqing_nor",selectImage: "liaotian_ic_jianpan_nor")
        smileButton.addTarget(self, action: #selector(smileButtonAction), for: .touchUpInside)
        
        view1.addSubview(smileButton)
        
        let rightButton = self.getAButton(title: "展开", frame: CGRect(x: frame.width - (frame.height - 10) - 10, y: 5, width: frame.height - 10, height: frame.height - 10), backColor: .red,nomalImage: "liaotian_ic_gengduo_nor",selectImage: "liaotian_ic_gengduo_nor")
        rightButton.addTarget(self, action: #selector(rightButtonAction), for: .touchUpInside)
        view1.addSubview(rightButton)
        
        
        textView = UITextView(frame: CGRect(x: voiceButton.frame.origin.x + voiceButton.frame.width + 10,y: 10,width: smileButton.frame.origin.x - voiceButton.frame.origin.x - voiceButton.frame.width - 20, height: 30))
        textView.tag = 100
        textView.backgroundColor = .white
        textView.layer.masksToBounds = true
        textView.layer.cornerRadius = 3
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 0.5
        textView.delegate = self
        view1.addSubview(textView)
        return view1
    }
    
    func getAButton(title:String ,frame:CGRect,backColor:UIColor,nomalImage:String,selectImage:String) -> UIButton {
        let leftButton = UIButton(type: .custom)
        leftButton.frame = frame
        leftButton.layer.masksToBounds = true
//        leftButton.backgroundColor = backColor
//        leftButton.setTitle(title, for: .normal)
//        leftButton.setTitleColor(.white, for: .normal)
        leftButton.setImage(UIImage(named: nomalImage), for: .normal)
        leftButton.setImage(UIImage(named: selectImage), for: .selected)
        leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        leftButton.layer.cornerRadius = frame.height/2
        return leftButton
    }
    func leftButtonAction(button:UIButton) {
        if button.titleLabel?.text == "语音" {
            button.setTitle("文字", for: .normal)
            //            myDelegate.leftActionClick(typeButton: leftButtonType.Voice)
        }else{
            //            textView.becomeFirstResponder()
            button.setTitle("语音", for: .normal)
            
            //            myDelegate.leftActionClick(typeButton: leftButtonType.Write)
        }
    }
    
    func smileButtonAction(button:UIButton) {
        textView.resignFirstResponder()
        
        if button.isSelected == false {
            self.resignFirstResponder()
            textView.inputView = view2
            //            myDelegate.leftActionClick(typeButton: leftButtonType.Smile)
        }else{
            self.becomeFirstResponder()
            textView.inputView = nil
            //            myDelegate.leftActionClick(typeButton: leftButtonType.Write)
        }
        button.isSelected = !button.isSelected
        textView.becomeFirstResponder()

    }
    
    func rightButtonAction(button:UIButton) {
        if button.titleLabel?.text == "展开" {
            button.setTitle("收起", for: .normal)
            //            myDelegate.leftActionClick(typeButton: leftButtonType.Open)
        }else{
            button.setTitle("展开", for: .normal)
            //            myDelegate.leftActionClick(typeButton: leftButtonType.Close)
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        let contentSize = self.textView.contentSize
        newTextViewHeight = Int(contentSize.height)/22
       
        if newTextViewHeight == 1 {
            view1.frame = CGRect(x:view1.frame.origin.x, y:0, width:view1.frame.width, height:50);
            self.textView.frame = CGRect(x:self.textView.frame.origin.x, y:10, width:self.textView.frame.width, height:30);
            
        }else if newTextViewHeight > oldTextViewHeight {
            self.textView.frame = CGRect(x:self.textView.frame.origin.x, y:10, width:self.textView.frame.width, height:self.textView.frame.height + 22);
            view1.frame = CGRect(x:view1.frame.origin.x, y:view1.frame.origin.y - 22, width:view1.frame.width, height:view1.frame.height + 22);
            oldTextViewHeight = newTextViewHeight
            
        }else if newTextViewHeight < oldTextViewHeight {
            self.textView.frame = CGRect(x:self.textView.frame.origin.x, y:10, width:self.textView.frame.width, height:self.textView.frame.height - 22);
            view1.frame = CGRect(x:0, y:view1.frame.origin.y + 22, width:view1.frame.width, height:view1.frame.height - 22);
            oldTextViewHeight = newTextViewHeight
            
        }else{
            return
        }
        
        
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            myDelegate.sendMessage(sendString: textView.text)
            textView.text = ""
            return false
        }
        
        return true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
//        smileButton.setTitle("笑脸", for: .normal)
//        voiceButton.setTitle("语音", for: .normal)
        
    }
    
    func finishDone() {
        textView.resignFirstResponder()
//        self.resignFirstResponder()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
