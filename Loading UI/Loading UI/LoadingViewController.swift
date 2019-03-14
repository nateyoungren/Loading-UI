//
//  LoadingViewController.swift
//  Loading UI
//
//  Created by Nathanael Youngren on 3/13/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

public class LoadingViewController: UIViewController {
    
    public override func viewDidLoad() {
        showCircle()
        view.backgroundColor = backgroundColor ?? UIColor.white
    }
    
    private func showCircle() {
        let circleSize = self.size ?? 30

        let x = view.center.x - (circleSize / 2)
        let y = view.center.y - (circleSize / 2)

        let circleFrame = CGRect(x: x, y: y, width: circleSize, height: circleSize)
        let circle = UIBezierPath(ovalIn: circleFrame)
        layer.path = circle.cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.lineCap = CAShapeLayerLineCap.round
        layer.strokeEnd = 0

        layer.strokeColor = self.color ?? UIColor.lightGray.cgColor
        layer.lineWidth = self.width ?? 15

        view.layer.addSublayer(layer)

        animate()
    }

    func animate() {
        circleAnimation.keyPath = "strokeEnd"
        circleAnimation.toValue = 1
        circleAnimation.duration = 1
        circleAnimation.fillMode = CAMediaTimingFillMode.forwards
        circleAnimation.isRemovedOnCompletion = false
        circleAnimation.repeatCount = .infinity
        circleAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        layer.add(circleAnimation, forKey: "load")
    }

    public var backgroundColor: UIColor?
    public var width: CGFloat?
    public var color: CGColor?
    public var size: CGFloat?
    
    private var layer = CAShapeLayer()
    private var circleAnimation = CABasicAnimation()
}
