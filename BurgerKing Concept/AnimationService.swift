//
//  AnimationService.swift
//  BurgerKing Concept
//
//  Created by Rachit Prajapati on 22/04/21.
//

import UIKit

struct AnimationService {
    
     //MARK: - Letters
    
     func splashAnimation(iv: UIImageView, const: CGFloat) {
        iv.alpha = 1
        UIView.animate(withDuration: 0.5) {
            iv.center.y -= 1.5*const
            } completion: { (true) in
                UIView.animate(withDuration: 0.25) {
                    iv.center.y += 3*const
                } completion: { (true) in
                    UIView.animate(withDuration: 0.5) {
                        iv.center.y -= 1.5*const
                    }
                }
            }
        
        UIView.animate(withDuration: 0.5) {
            let anim = CABasicAnimation(keyPath: "transform.scale")
            anim.fromValue = 0.0
            anim.toValue = 1.0
            anim.duration = 0.5
            anim.fillMode = CAMediaTimingFillMode.backwards
            iv.layer.add(anim, forKey: nil)
        } completion: { (true) in
            UIView.animate(withDuration: 0.6, delay: 0.0) {
                iv.transform = iv.transform.scaledBy(x: 1.0, y: 1.7)
            } completion: { (true) in
                UIView.animate(withDuration: 6.0, delay: 0.0, usingSpringWithDamping: 0.15, initialSpringVelocity: 0.0) {
                    iv.transform = iv.transform.scaledBy(x: 1.0, y: 0.66)
                }
            }
        }
    }
    
     //MARK: - Buns
    func animateBun(iv: UIImageView, y: CGFloat) {
        iv.alpha = 1
        UIView.animate(withDuration: 0.5, delay: 0.0) {
            iv.transform = CGAffineTransform(translationX: -30.0, y: y)
        }
        
        let anim = CASpringAnimation(keyPath: "transform.scale")
        anim.fromValue = 0.4
        anim.toValue = 1.0
        anim.damping = 5.5
        anim.initialVelocity = 10.0
        anim.duration = anim.settlingDuration
        iv.layer.add(anim, forKey:  nil)
        
        UIView.animate(withDuration: 1.6, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0) {
            iv.transform = iv.transform.scaledBy(x: 1.5, y: 0.6)
        } completion: { (true) in
            UIView.animate(withDuration: 1.6, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0) {
                iv.transform = iv.transform.scaledBy(x: 1.0, y: 1.0)
            }
        }
        iv.transform = CGAffineTransform.identity
        iv.transform = CGAffineTransform(rotationAngle: -.pi/15)
    }
    
    
     //MARK: - Blue ring
    
    func ringAnimation(iv: UIImageView) {
        iv.alpha = 1
        let anim = CASpringAnimation(keyPath: "transform.scale")
        anim.fromValue = 0.0
        anim.toValue = 1.0
        anim.damping = 2.5
        anim.duration = anim.settlingDuration
        iv.layer.add(anim, forKey: nil)
    }
    
    
     //MARK: - Drops
    func createPath(forDrop iv: UIImageView, radius: CGFloat) {
        
        iv.alpha = 1
        let orbit = CAKeyframeAnimation(keyPath: "position")
        let circlePath = UIBezierPath(arcCenter:   CGPoint(x: 180, y: 200), radius: radius, startAngle: .pi, endAngle: .pi + 1, clockwise: false)
        orbit.path = circlePath.cgPath
        orbit.calculationMode = .paced
        orbit.fillMode = CAMediaTimingFillMode.both
    
        let dropOrientation = CABasicAnimation(keyPath:
        "transform.rotation")
        dropOrientation.fromValue = 0
        dropOrientation.toValue = -2.0 * CGFloat.pi
        dropOrientation.fillMode = CAMediaTimingFillMode.both
        
        
        let anim = CAKeyframeAnimation(keyPath: "transform.scale")
        anim.values = [0.5, 1.5, 1.0, 0.0]
        anim.keyTimes = [0.25, 0.5, 0.65, 1.0]
        dropOrientation.fillMode = CAMediaTimingFillMode.both
        
        let dropGroup = CAAnimationGroup()
        dropGroup.duration = 1.0
        dropGroup.animations = [orbit, dropOrientation, anim]
        iv.layer .add(dropGroup, forKey: "orbit")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            iv.alpha = 0
        }
    }
}
