//
//  LoadingViewController.swift
//  Loading UI
//
//  Created by Nathanael Youngren on 3/13/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

public class LoadingViewController: UIViewController {
    
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

        animate()
    }

    private func animate() {
        circleAnimation.keyPath = "strokeEnd"
        circleAnimation.toValue = 1
        circleAnimation.duration = 1
        circleAnimation.fillMode = CAMediaTimingFillMode.forwards
        circleAnimation.isRemovedOnCompletion = false
        circleAnimation.repeatCount = .infinity
        circleAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        circleLayer.add(circleAnimation, forKey: "load")
    }

    public var backgroundColor: UIColor?
    public var width: CGFloat?
    public var color: CGColor?
    public var size: CGFloat?
    
    private var circleLayer = CAShapeLayer()
    private var circleAnimation = CABasicAnimation()
}
