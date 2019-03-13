//
//  LoadingViewController.swift
//  Loading UI
//
//  Created by Nathanael Youngren on 3/13/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import Foundation

public class LoadingViewController: UIViewController {
    
    public override func viewDidLoad() {
        animatingCircle()
        view.backgroundColor = backgroundColor ?? UIColor.white
    }
    
    private func animatingCircle() {
        layer = CAShapeLayer()

        let circleSize = self.size ?? 30
        
        let x = view.center.x - (circleSize / 2)
        let y = view.center.y - (circleSize / 2)
        
        let circleFrame = CGRect(x: x, y: y, width: circleSize, height: circleSize)
        let circle = UIBezierPath(ovalIn: circleFrame)
        layer.path = circle.cgPath
        layer.fillColor = UIColor.clear.cgColor
        
        layer.strokeColor = self.color ?? UIColor.gray.cgColor
        layer.lineWidth = self.thickness ?? 15
        
        // add layer to view
        view.layer.addSublayer(layer)
    }
    
    public var backgroundColor: UIColor?
    public var thickness: CGFloat?
    public var color: CGColor?
    public var size: CGFloat?
    private var layer: CAShapeLayer!
}
