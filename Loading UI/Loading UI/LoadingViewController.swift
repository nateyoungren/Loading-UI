//
//  LoadingViewController.swift
//  Loading UI
//
//  Created by Nathanael Youngren on 3/13/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import Foundation

public class LoadingViewController: UIViewController {
    
    public func begin() {
        animatingCircle()
    }
    
    public func end() {
        
    }
    
    private func animatingCircle() {
        layer = CAShapeLayer()
        
        let center = view.center
        if self.size == nil {
            self.size = 25
        }
        let circleFrame = CGRect(x: center.x, y: center.y, width: size!, height: size!)
        let circle = UIBezierPath(ovalIn: circleFrame)
        layer.path = circle.cgPath
        
        
        // add layer to view
        view.layer.addSublayer(layer)
    }
    
    public var size: CGFloat?
    private var layer: CAShapeLayer!
}
