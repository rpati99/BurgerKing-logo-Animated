//
//  ViewController.swift
//  BurgerKing Concept
//
//  Created by Rachit Prajapati on 18/03/21.
//

import UIKit


func delay(seconds: Double, completion: @escaping() -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}
extension UIImageView {
    
    func create(name: String) -> UIImageView {
        let iv = UIImageView()
        iv.setDimensions(width: 30, height: 40)
        iv.image = UIImage(named: name)
        iv.contentMode = .scaleAspectFill
        return  iv
    }
    
    func create2(name: String) -> UIImageView {
        let iv = UIImageView()
        iv.setDimensions(width: 45, height: 60)
        iv.image = UIImage(named: name)
        iv.contentMode = .scaleAspectFill
        return  iv
    }
}

class ViewController: UIViewController {

   
    // MARK: - Elements
    private let b: UIImageView = {
        let iv = UIImageView().create(name: "B")
        return  iv
    }()
    private let u: UIImageView = {
        let iv = UIImageView().create(name: "U")
        return  iv
    }()
    private let r1: UIImageView = {
        let iv = UIImageView().create(name: "R")

        return  iv
    }()
    private let g: UIImageView = {
        let iv = UIImageView().create(name: "G")
        return  iv
    }()
    private let e: UIImageView = {
        let iv = UIImageView().create(name: "E")

        return  iv
    }()
    private let r2: UIImageView = {
        let iv = UIImageView().create(name: "R")
       
        return  iv
    }()
    
    private let k: UIImageView = {
        let iv = UIImageView().create2(name: "K")
        iv.setDimensions(width: 45, height: 60)
        return  iv
    }()
    private let i: UIImageView = {
        let iv = UIImageView().create2(name: "I")
        iv.setDimensions(width: 45, height: 60)
        iv.contentMode = .scaleAspectFit
        return  iv
    }()
    private let n: UIImageView = {
        let iv = UIImageView().create2(name: "N")
       
        return  iv
    }()
    private let g2: UIImageView = {
        let iv = UIImageView().create2(name: "G")
        return  iv
    }()
    
    private lazy var upperBun: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "upperBun")
        iv.setDimensions(width: 160, height: 60)
       
        return iv
    }()
    
    private let lowerBun: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "lowerBun")
        iv.setDimensions(width: 160, height: 50)
        return iv
    }()
    
    private let ring: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Ring")
       
        return iv
    }()
    
    private let whiteDrop: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "whiteDrop")
       
        return iv
    }()
    private let yellow: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "yellowDrop")
        return iv
    }()
    
    private let objectToMove: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "white")
        iv.heightAnchor.constraint(equalToConstant: 60).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return iv
    }()
    
    private let objectToMove2: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "pink")
        iv.heightAnchor.constraint(equalToConstant: 60).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return iv
    }()
    
    
    

    
    // MARK: - Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
     
    }
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        //burger
        delay(seconds: 0.1) {
            self.splashAnimation(iv: self.b, const: 30)
           
        }
        
        
       delay(seconds: 0.2) {
        self.splashAnimation(iv: self.u, const: 10)
       }
       delay(seconds: 0.3) {
        self.splashAnimation(iv: self.r1, const: 15)
       }
        delay(seconds: 0.4) { [self] in
        self.splashAnimation(iv: self.g, const: 20)
        self.splash2Animation(iv: self.upperBun, y: -30)
        self.splash2Animation(iv: self.lowerBun, y: 30)
            self.createPath(iv: self.objectToMove, radius: 130)
        
       }

        delay(seconds: 0.5) {
            self.splashAnimation(iv: self.e, const: 10)
            self.createPath(iv: self.objectToMove2, radius: 128)
        }

        delay(seconds: 0.6) {
            self.splashAnimation(iv: self.r2, const: 5)
          
        }

        //king
        delay(seconds: 0.8) {
            self.splashAnimation(iv: self.k, const: 5)
        }

        delay(seconds: 0.9) {
            self.splashAnimation(iv: self.i, const: 5)
       }
       delay(seconds: 1.0) {
        self.splashAnimation(iv: self.n, const: 5)
        self.ringAnimation(iv: self.ring)
       }
       delay(seconds: 1.1) {
        self.splashAnimation(iv: self.g2, const: 5)
       }
         
        
        
    }
    
    // MARK: - API
    
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
    
    func splash2Animation(iv: UIImageView, y: CGFloat) {
        
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
    
    func ringAnimation(iv: UIImageView) {
        iv.alpha = 1
        let anim = CASpringAnimation(keyPath: "transform.scale")
        anim.fromValue = 0.0
        anim.toValue = 1.0
        anim.damping = 2.5
        anim.duration = anim.settlingDuration
        iv.layer.add(anim, forKey: nil)
    }
    
    func createPath(iv: UIImageView, radius: CGFloat) {
        
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
    
    
    
    
    
    
    // MARK: - Helpers
    
    private func setupUI() {
        view.backgroundColor =  UIColor(red: 35/255, green: 35/255, blue: 32/255, alpha: 1.0)
        b.alpha = 0
        u.alpha = 0
        r1.alpha = 0
        g.alpha = 0
        e.alpha = 0
        r2.alpha = 0
        k.alpha = 0
        i.alpha = 0
        n.alpha = 0
        g2.alpha = 0
        upperBun.alpha = 0
        lowerBun.alpha = 0
        ring.alpha = 0
        objectToMove.alpha  = 0
        objectToMove2.alpha = 0
        view.addSubview(ring)
        ring.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 45)
        ring.setDimensions(width: 260, height: 260)
        
        let circleView = CirclePath(frame: CGRect(x: 120, y: 120, width: 120, height: 120))
        view.addSubview(circleView)
        let circleView2 = CirclePath(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        view.addSubview(circleView2)
        let circleView3 = CirclePath(frame: CGRect(x: 60, y: 80, width: 270, height: 270))
        view.addSubview(circleView3)
        let circleView4 = CirclePath(frame: CGRect(x: 70, y: 80, width: 270, height: 270))
        view.addSubview(circleView4)
        
        view.addSubview(b)
        b.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,paddingTop: 120, paddingLeft: 80)
        b.transform = CGAffineTransform(rotationAngle: -.pi/11)
        view.addSubview(u)
        u.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: b.rightAnchor,paddingTop: 110, paddingLeft: 5)
        u.transform = CGAffineTransform(rotationAngle: -.pi/12)
        view.addSubview(r1)
        r1.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: u.rightAnchor,paddingTop: 101.5, paddingLeft: 2)
        r1.transform = CGAffineTransform(rotationAngle: -.pi/12.5)
        view.addSubview(g)
        g.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: r1.rightAnchor,paddingTop: 92, paddingLeft: 8)
        g.transform = CGAffineTransform(rotationAngle: -.pi/13.75)
        view.addSubview(e)
        e.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: g.rightAnchor,paddingTop: 86, paddingLeft: 2)
        e.transform = CGAffineTransform(rotationAngle: -.pi/14.5)
        view.addSubview(r2)
        r2.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: e.rightAnchor,paddingTop: 80, paddingLeft: -1)
        r2.transform = CGAffineTransform(rotationAngle: -.pi/16)
        view.addSubview(k)
        k.anchor(top: b.bottomAnchor, left: view.leftAnchor, paddingTop: 7, paddingLeft: 90)
        k.transform = CGAffineTransform(rotationAngle: -.pi/11)
        view.addSubview(i)
        i.anchor(top: r1.bottomAnchor, left: k.rightAnchor, paddingTop: 11.5, paddingLeft: -7)
        i.transform = CGAffineTransform(rotationAngle: -.pi/12.5)
        view.addSubview(n)
        n.anchor(top: g.bottomAnchor, left: i.rightAnchor, paddingTop: 11, paddingLeft: -2)
        n.transform = CGAffineTransform(rotationAngle: -.pi/13.75)
        view.addSubview(g2)
        g2.anchor(top: r2.bottomAnchor, left: n.rightAnchor, paddingTop: 11.5, paddingLeft: 14)
        g2.transform = CGAffineTransform(rotationAngle: -.pi/16)
        
        view.addSubview(upperBun)
        upperBun.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor ,paddingTop: 40, paddingLeft: 90)
        upperBun.transform = CGAffineTransform(rotationAngle: -.pi/15)
        view.addSubview(lowerBun)
        lowerBun.centerX(inView: view)
        lowerBun.anchor(top: n.bottomAnchor ,paddingTop: 8)
        lowerBun.transform = CGAffineTransform(rotationAngle: -.pi/14)
       

        
        view.addSubview(objectToMove)
        objectToMove.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        objectToMove.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        view.addSubview(objectToMove2)
        objectToMove2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        objectToMove2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        
        
       
    }
    
    


  
}

