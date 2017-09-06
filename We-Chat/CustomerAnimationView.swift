//
//  CustomerAnimationView.swift
//  We-Chat
//
//  Created by 许菠菠 on 2017/8/31.
//  Copyright © 2017年 许菠菠. All rights reserved.
//

import UIKit

enum iQiYiPlayButtonState {
    case iQiYiPlayButtonStatePause
    case iQiYiPlayButtonStatePlay
}

class CustomerAnimationView: UIView ,CAAnimationDelegate{

    private var leftLineLayer : CAShapeLayer!//左侧竖条
    private var triangleLayer : CAShapeLayer!//三角
    private var rightLineLayer : CAShapeLayer!//右侧竖条
    private var circleLayer : CAShapeLayer!//画弧layer
    private var a : CGFloat!
    private let LineColor = UIColor(red: 12/255.0, green: 190/255.0, blue: 6/255.0, alpha: 1)
    private let animationDuration :CGFloat = 0.5//其他动画时长
    private let positionDuration : CGFloat = 0.3//位移动画时长
    
   override init(frame: CGRect) {
        super.init(frame: frame)
        a = frame.width
        self.backgroundColor = .gray
        let button = UIButton(type:.custom)
        button.frame = CGRect(x: (frame.width - 50)/2, y: frame.width - 30, width: 50, height: 30)
        button.setTitle("begin", for: .normal)
        button.setTitle("end", for: .selected)
        button.setTitleColor(.white, for: .normal)
        button.isSelected = false
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.addSubview(button)
        
        self.addLeftLineLayer()
        self.addCircleLayer()
        self.addRightLineLayer()
        self.addTriangleLayer()
    
    }
    /**
     添加三角层
     */

    func addTriangleLayer() {

        let path = UIBezierPath()
        path.move(to: CGPoint(x: a*0.2, y: a*0.2))
        path.addLine(to: CGPoint(x:a*0.2,y:0))
        path.addLine(to: CGPoint(x:a,y:a*0.5))
        path.addLine(to: CGPoint(x:a*0.2,y:a))
        path.addLine(to: CGPoint(x:a*0.2,y:a*0.2))
        triangleLayer = CAShapeLayer()
        triangleLayer.path = path.cgPath
        triangleLayer.strokeColor = LineColor.cgColor
        triangleLayer.fillColor = UIColor.clear.cgColor
        triangleLayer.lineWidth = self.lineWidth()
        triangleLayer.lineCap = kCALineCapRound
        triangleLayer.lineJoin = kCALineJoinRound
        self.layer.addSublayer(triangleLayer)

        
        
        
    }
    /**
     左边线条
     */

    func addLeftLineLayer() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: a*0.2, y:0))
        path.addLine(to: CGPoint(x:a*0.2,y:a))
        leftLineLayer = CAShapeLayer()
        leftLineLayer.path = path.cgPath
        leftLineLayer.strokeColor = LineColor.cgColor
        leftLineLayer.fillColor = UIColor.clear.cgColor
        leftLineLayer.lineWidth = self.lineWidth()
        leftLineLayer.lineCap = kCALineCapRound
        leftLineLayer.lineJoin = kCALineJoinRound
        self.layer.addSublayer(leftLineLayer)

    }
    
    func addRightLineLayer() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: a*0.8, y:a))
        path.addLine(to: CGPoint(x:a*0.8,y:0))
        rightLineLayer = CAShapeLayer()
        rightLineLayer.path = path.cgPath
        rightLineLayer.strokeColor = LineColor.cgColor
        rightLineLayer.fillColor = UIColor.clear.cgColor
        rightLineLayer.lineWidth = self.lineWidth()
        rightLineLayer.lineCap = kCALineCapRound
        rightLineLayer.lineJoin = kCALineJoinRound
        self.layer.addSublayer(rightLineLayer)

    }
    func addCircleLayer()  {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: a*0.8, y:a*0.8))
        path.addArc(withCenter: CGPoint(x:a*0.5,y:a*0.8), radius: 0.3*a, startAngle: 0, endAngle: CGFloat(M_PI), clockwise: true)
        circleLayer = CAShapeLayer()
        circleLayer.path = path.cgPath
        circleLayer.strokeColor = LineColor.cgColor
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineWidth = self.lineWidth()
        circleLayer.lineCap = kCALineCapRound
        circleLayer.lineJoin = kCALineJoinRound
        self.layer.addSublayer(circleLayer)
    }
    //线条宽度，根据按钮的宽度按比例设置
    func lineWidth() -> CGFloat {
        return self.layer.bounds.size.width * 0.18;

    }
    
    /**
     执行正向动画，即暂停-》播放
     */
    //竖线动画
    func linePositiveAnimation() {
        //左侧缩放动画
        let path =  UIBezierPath()
        path.move(to: CGPoint(x:0.2*a,y:0.4*a))
        path.addLine(to: CGPoint(x:0.2*a,y:a))
        leftLineLayer.path = path.cgPath
        leftLineLayer.add(self.pathAnimationWithDuration(duration: CGFloat(positionDuration/2)), forKey: nil)
        
        //右侧侧缩放动画
        let path1 =  UIBezierPath()
        path1.move(to: CGPoint(x:0.8*a,y:0.8*a))
        path1.addLine(to: CGPoint(x:0.8*a,y:-0.2*a))
        rightLineLayer.path = path.cgPath
        rightLineLayer.add(self.pathAnimationWithDuration(duration: CGFloat(positionDuration/2)), forKey: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            //左侧缩放动画
            let path =  UIBezierPath()
            path.move(to: CGPoint(x:0.2*self.a,y:0.2*self.a))
            path.addLine(to: CGPoint(x:0.2*self.a,y:self.a*0.8))
            self.leftLineLayer.path = path.cgPath
            self.leftLineLayer.add(self.pathAnimationWithDuration(duration: CGFloat(self.positionDuration/2)), forKey: nil)
            
            //右侧侧缩放动画
            let path1 =  UIBezierPath()
            path1.move(to: CGPoint(x:0.8*self.a,y:0.8*self.a))
            path1.addLine(to: CGPoint(x:0.8*self.a,y:0.2*self.a))
            self.rightLineLayer.path = path.cgPath
            self.rightLineLayer.add(self.pathAnimationWithDuration(duration: CGFloat(self.positionDuration/2)), forKey: nil)
        }
    }
    
    func actionPositiveAnimation() {
//        //开始三角动画
       self.strokeEndAnimation(from: 0, to: 1, onLayer: triangleLayer, animationName: "TriangleAnimation", duration: animationDuration, delegate: self)
//        //开始右侧线条动画
         self.strokeEndAnimation(from: 1, to: 0, onLayer: rightLineLayer, animationName: "RightLineAnimation", duration: animationDuration/4, delegate: self)
//        //开始画弧动画
        self.strokeEndAnimation(from: 0, to: 1, onLayer: circleLayer, animationName:"", duration: animationDuration/4, delegate:"" as AnyObject)
//        //开始逆向画弧动画
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            self.circleStartAnimation(fromValue: 0, toValue: 1)
        }

//        //开始左侧线条缩短动画
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            self.strokeEndAnimation(from: 1, to: 0, onLayer: self.leftLineLayer, animationName: "", duration: self.animationDuration/2, delegate: "" as AnyObject)
        }

    }
    /**
     执行逆向动画，即播放-》暂停
     */
    func actionInverseAnimation()  {
        //开始三角动画
        self.strokeEndAnimation(from: 1, to: 0, onLayer: triangleLayer, animationName: "TriangleAnimation", duration: animationDuration, delegate: self)
        //开始右侧线条动画
        self.strokeEndAnimation(from: 0, to: 1, onLayer: leftLineLayer, animationName: "", duration: animationDuration/2, delegate: "" as AnyObject)
        //执行画弧动画
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            self.circleStartAnimation(fromValue: 1, toValue: 0)
        }
        
        //        //开始左侧线条缩短动画
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            //右侧竖线动画
            self.strokeEndAnimation(from: 0, to: 1, onLayer: self.rightLineLayer, animationName: "RightLineAnimation", duration: self.animationDuration/4, delegate: self)
            self.strokeEndAnimation(from: 1, to: 0, onLayer: self.circleLayer, animationName: "", duration: self.animationDuration/4, delegate: "" as AnyObject)
        }
        
    }
    

    func strokeEndAnimation(from:CGFloat,to:CGFloat,onLayer:CALayer,animationName:String,duration:CGFloat,delegate:AnyObject) {
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = CFTimeInterval(duration)
        pathAnimation.fromValue = from
        pathAnimation.toValue = to
        pathAnimation.setValue(animationName, forKey: "animationName")
        pathAnimation.delegate = self
        pathAnimation.fillMode = kCAFillModeForwards
        pathAnimation.isRemovedOnCompletion = false
        onLayer.add(pathAnimation, forKey: nil)
    }
    
    func animationDidStart(_ anim: CAAnimation) {
        let name = anim.value(forKey: "animationName") as! String
        if name == "TriangleAnimation" {
            triangleLayer.lineCap = kCALineCapRound
        }else if name == "RightLineAnimation" {
            rightLineLayer.lineCap = kCALineCapRound
        }
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let name = anim.value(forKey: "animationName") as! String
        if name == "TriangleAnimation" {
            triangleLayer.lineCap = kCALineCapButt
        }else if name == "RightLineAnimation" {
            rightLineLayer.lineCap = kCALineCapButt
        }

    }
    /**
     通用path动画方法
     */
    func pathAnimationWithDuration(duration:CGFloat) -> CABasicAnimation {
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.duration = CFTimeInterval(duration)
        pathAnimation.fillMode = kCAFillModeForwards
        pathAnimation.isRemovedOnCompletion = false
        return pathAnimation
    }
    /**
     画弧改变起始位置动画
     */
    func circleStartAnimation(fromValue:CGFloat,toValue:CGFloat)  {
        let pathAnimation = CABasicAnimation(keyPath: "strokeStart")
        pathAnimation.duration = CFTimeInterval(animationDuration/4)
        pathAnimation.fillMode = kCAFillModeForwards
        pathAnimation.fromValue = fromValue
        pathAnimation.toValue = toValue
        pathAnimation.isRemovedOnCompletion = false
        circleLayer.add(pathAnimation, forKey: nil)
    }
    
    func lineInverseAnimation() {
        //左侧缩放动画
        let path =  UIBezierPath()
        path.move(to: CGPoint(x:0.2*a,y:0.4*a))
        path.addLine(to: CGPoint(x:0.2*a,y:a))
        leftLineLayer.path = path.cgPath
        leftLineLayer.add(self.pathAnimationWithDuration(duration: CGFloat(positionDuration/2)), forKey: nil)
        
        //右侧侧缩放动画
        let path1 =  UIBezierPath()
        path1.move(to: CGPoint(x:0.8*a,y:0.8*a))
        path1.addLine(to: CGPoint(x:0.8*a,y:-0.2*a))
        rightLineLayer.path = path.cgPath
        rightLineLayer.add(self.pathAnimationWithDuration(duration: CGFloat(positionDuration/2)), forKey: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) {
            //左侧缩放动画
            let path =  UIBezierPath()
            path.move(to: CGPoint(x:0.2*self.a,y:0))
            path.addLine(to: CGPoint(x:0.2*self.a,y:self.a))
            self.leftLineLayer.path = path.cgPath
            self.leftLineLayer.add(self.pathAnimationWithDuration(duration: CGFloat(self.positionDuration/2)), forKey: nil)
            
            //右侧侧缩放动画
            let path1 =  UIBezierPath()
            path1.move(to: CGPoint(x:0.8*self.a,y:self.a))
            path1.addLine(to: CGPoint(x:0.8*self.a,y:0))
            self.rightLineLayer.path = path.cgPath
            self.rightLineLayer.add(self.pathAnimationWithDuration(duration: CGFloat(self.positionDuration/2)), forKey: nil)
        }

    }
    
    func buttonAction(btn:UIButton)  {
        if btn.isSelected {
            btn.isSelected = false
            //先执行画弧、画三角动画
            self.actionInverseAnimation();
            //再执行画弧、画三角动画
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: {
                //竖线逆向动画
                self.lineInverseAnimation()
            })

        }else{
            btn.isSelected = true
            //竖线正向动画
            self.linePositiveAnimation();
            //再执行画弧、画三角动画
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: {
                self.actionPositiveAnimation()
            })

        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
