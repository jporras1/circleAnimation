//
//  ViewController.swift
//  circleAnimation
//
//  Created by Javier Porras jr on 10/16/19.
//  Copyright © 2019 Javier Porras jr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let trackLayer = CAShapeLayer()
    let shapeLayer = CAShapeLayer() //place here so that they may be reference from within other closures.

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        let center = view.center
        //MARK: Track Layer
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.white.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = 10
        view.layer.addSublayer(trackLayer)
        
        //MARK: Animated layer.
        //ToDo: Create an extension that allows for degrees instead of radians.
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round //is used to make the outside line a smooth circle, however I kinda like the blunt squareness of the standard one.
        shapeLayer.strokeEnd = 0 //placed here to instantiate the circle with out the "RED" border
        
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc
    fileprivate func handleTap(){
        print("Got Tapped")
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
}

