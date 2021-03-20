//
//  CirclePath.swift
//  BurgerKing Concept
//
//  Created by Rachit Prajapati on 20/03/21.
//

import UIKit

class CirclePath: UIView {
    
    let shapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(shapeLayer)
        
        let path = UIBezierPath(ovalIn: bounds)
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = 4
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        shapeLayer.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.shapeLayer.isHidden = false
            let start = CABasicAnimation(keyPath: "strokeEnd")
            start.fromValue = 1.0
            start.toValue = 0.0
            start.duration = 1.0
          
            
            let end = CABasicAnimation(keyPath: "strokeStart")
            end.fromValue = 1.0
            end.toValue = -0.6
            end.duration = 1.0
            
            
            let group = CAAnimationGroup()
            group.animations = [start, end]
            group.duration = 1.0
            self.shapeLayer.add(group, forKey: nil)
        }
        

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.shapeLayer.isHidden = true
        }
       
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
