//
//  gardiant.swift
//  nasaImages
//
//  Created by Ron Tabachnik on 2022-09-19.
//

import Foundation
import UIKit

extension UIView {
    public func setTwoGradient(first: UIColor,second: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [first.cgColor,second.cgColor]
        
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0,y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0 ,y: 1.0)
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
}
