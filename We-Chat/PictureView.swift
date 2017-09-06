//
//  PictureView.swift
//  We-Chat
//
//  Created by 许菠菠 on 2017/9/5.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

class PictureView: UIView {

    private var faceLayer : CAShapeLayer!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        self.creatUI(number: 6)
        
//        self.createFace()
    }
    
    func viewClick(tap:UITapGestureRecognizer) {
        let point = tap.location(in: tap.view)
        let faceRadius = self.frame.width/2 - 40
        let faceCenter = self.center
        if point.x > faceCenter.x - faceRadius && point.x < faceCenter.x + faceRadius &&  point.y > faceCenter.y - faceRadius && point.y < faceCenter.y + faceRadius{
            print("圆内点击")
            print("x ==\(point.x),y == \(point.y)")

        }else{
            print("圆外点击")

            print("x ==\(point.x),y == \(point.y)")

        }
    }
    func creatUI(number:Int) {
       
        let center = CGPoint(x:self.frame.width/2,y:self.frame.height/2)
        
        for i in 0...5 {
            let facePath1 = UIBezierPath()
            facePath1.move(to: center)
            facePath1.addArc(withCenter: center, radius: self.frame.width/2, startAngle: CGFloat(i) * .pi/3, endAngle: CGFloat(i+1) * .pi/3, clockwise: true)
            let faceLayer1 = CAShapeLayer()
            faceLayer1.path = facePath1.cgPath
            faceLayer1.fillColor = UIColor.init(patternImage: UIImage(named:"狼")!).cgColor
            self.layer.addSublayer(faceLayer1)
        }

    }
    
    
    /*
    func createFace() {
        let faceRadius = self.frame.width/2 - 40
        let faceCenter = CGPoint(x:182,y:335)

        let facePath = UIBezierPath()
        facePath.addArc(withCenter: CGPoint(x:182,y:335), radius: self.frame.width/2 - 40, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        faceLayer = CAShapeLayer()
        faceLayer.path = facePath.cgPath
        faceLayer.fillColor = UIColor.white.cgColor
        self.layer.addSublayer(faceLayer)
        
        
        let eyeLeft = CGPoint(x:120,y:272)
        let eyePath = UIBezierPath()
        eyePath.addArc(withCenter: eyeLeft, radius: 20, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        let eyeLeftLayer = CAShapeLayer()
        eyeLeftLayer.path = eyePath.cgPath
        eyeLeftLayer.fillColor = UIColor.red.cgColor
        faceLayer.addSublayer(eyeLeftLayer)
        
        let eyeRight = CGPoint(x:self.frame.width - 120,y:272)
        let eyePathRight = UIBezierPath()
        eyePathRight.addArc(withCenter: eyeRight, radius: 20, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        let eyeRightLayer = CAShapeLayer()
        eyeRightLayer.path = eyePathRight.cgPath
        eyeRightLayer.fillColor = UIColor.red.cgColor
        faceLayer.addSublayer(eyeRightLayer)
        

        let mousePath = UIBezierPath()
        mousePath.addArc(withCenter: faceCenter, radius: faceRadius/2, startAngle:  .pi/6, endAngle: .pi - .pi/6, clockwise: true)
        let mouseLayer = CAShapeLayer()
        mouseLayer.path = mousePath.cgPath
        mouseLayer.fillColor = UIColor.red.cgColor
        faceLayer.addSublayer(mouseLayer)
        
        let nosePath = UIBezierPath()
        nosePath.move(to: CGPoint(x:faceCenter.x - 20,y:faceCenter.y + 10))
        nosePath.addLine(to: CGPoint(x:faceCenter.x,y:faceCenter.y - 50))
        nosePath.addLine(to: CGPoint(x:faceCenter.x + 20,y:faceCenter.y + 10))
        let noseLayer = CAShapeLayer()
        noseLayer.path = nosePath.cgPath
        noseLayer.fillColor = UIColor.red.cgColor
        faceLayer.addSublayer(noseLayer)
        

    }
 */
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
