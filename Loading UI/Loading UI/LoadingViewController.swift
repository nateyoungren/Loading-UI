//
//  LoadingViewController.swift
//  Loading UI
//
//  Created by Nathanael Youngren on 3/13/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

public class LoadingViewController: UIViewController, CAAnimationDelegate {
    
    override public func viewDidLoad() {
        showCircle()
    }
    
    private func showCircle() {
        view.backgroundColor = backgroundColor ?? UIColor.white
        
        let circleSize = self.size ?? 30

        let x = view.center.x - (circleSize / 2)
        let y = view.center.y - (circleSize / 2)

        let circleFrame = CGRect(x: x, y: y, width: circleSize, height: circleSize)
        let circle = UIBezierPath(ovalIn: circleFrame)
        circleLayer.path = circle.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = CAShapeLayerLineCap.round
        circleLayer.strokeEnd = 0

        circleLayer.strokeColor = self.color ?? UIColor.lightGray.cgColor
        circleLayer.lineWidth = self.width ?? 15

        view.layer.addSublayer(circleLayer)

        animate(keyPath: "strokeEnd")
    }

    private func animate(keyPath: String) {
        circleAnimation.keyPath = keyPath
        circleAnimation.fromValue = 0
        circleAnimation.toValue = 1
        circleAnimation.duration = 1
        circleAnimation.fillMode = CAMediaTimingFillMode.forwards
        circleAnimation.isRemovedOnCompletion = false
        circleAnimation.delegate = self
        circleAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        circleLayer.add(circleAnimation, forKey: "load")
    }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        if let anim = anim as? CABasicAnimation, anim.keyPath == "strokeEnd" {
            circleLayer.strokeStart = 0
            circleLayer.strokeEnd = 1
            circleLayer.removeAllAnimations()
            animate(keyPath: "strokeStart")
        }
        
        if let anim = anim as? CABasicAnimation, anim.keyPath == "strokeStart" {
            circleLayer.strokeStart = 0
            circleLayer.strokeEnd = 0
            circleLayer.removeAllAnimations()
            animate(keyPath: "strokeEnd")
        }
    }

    public var backgroundColor: UIColor?
    public var width: CGFloat?
    public var color: CGColor?
    public var size: CGFloat?
    
    private var circleLayer = CAShapeLayer()
    private var circleAnimation = CABasicAnimation()
}
