//
//  ViewController.swift
//  BurgerKing Concept
//
//  Created by Rachit Prajapati on 22/04/21.
//

import UIKit

func delay(seconds: Double, completion: @escaping() -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}

extension UIImageView {
    
    func create(name: String, width: CGFloat = 30, height: CGFloat = 40) -> UIImageView {
        let iv = UIImageView()
        iv.setDimensions(width: width, height: height)
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
        let iv = UIImageView().create(name: "K", width: 45, height: 60)
        iv.setDimensions(width: 45, height: 60)
        return  iv
    }()
    private let i: UIImageView = {
        let iv = UIImageView().create(name: "I", width: 45, height: 60)
        iv.setDimensions(width: 45, height: 60)
        iv.contentMode = .scaleAspectFit
        return  iv
    }()
    private let n: UIImageView = {
        let iv = UIImageView().create(name: "N", width: 45, height: 60)
        
        return  iv
    }()
    private let g2: UIImageView = {
        let iv = UIImageView().create(name: "G", width: 45, height: 60)
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
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "white")
        iv.heightAnchor.constraint(equalToConstant: 60).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return iv
    }()
    
    private let pinkDrop: UIImageView = {
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
        configureAnimations()
    }
    
    

    // MARK: - Helpers
    
    private func configureAnimations() {
        
        //burger
        delay(seconds: 0.1) {
            AnimationService().splashAnimation(iv: self.b, const: 30)
        }
        
        delay(seconds: 0.2) {
            AnimationService().splashAnimation(iv: self.u, const: 10)
        }
        
        delay(seconds: 0.3) {
            AnimationService().splashAnimation(iv: self.r1, const: 15)
        }
        
        delay(seconds: 0.4) { [self] in
            AnimationService().splashAnimation(iv: self.g, const: 20)
            AnimationService().animateBun(iv: self.upperBun, y: -30)
            AnimationService().animateBun(iv: self.lowerBun, y: 30)
            AnimationService().createPath(forDrop: self.whiteDrop, radius: 130)
            
        }
        
        delay(seconds: 0.5) {
            AnimationService().splashAnimation(iv: self.e, const: 10)
            AnimationService().createPath(forDrop: self.pinkDrop, radius: 128)
        }
        
        delay(seconds: 0.6) {
            AnimationService().splashAnimation(iv: self.r2, const: 5)
            
        }
        
        //king
        delay(seconds: 0.8) {
            AnimationService().splashAnimation(iv: self.k, const: 5)
        }
        
        delay(seconds: 0.9) {
            AnimationService().splashAnimation(iv: self.i, const: 5)
        }
        delay(seconds: 1.0) {
            AnimationService().splashAnimation(iv: self.n, const: 5)
            AnimationService().ringAnimation(iv: self.ring)
        }
        delay(seconds: 1.1) {
            AnimationService().splashAnimation(iv: self.g2, const: 5)
        }
    }
    
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
        whiteDrop.alpha  = 0
        pinkDrop.alpha = 0
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
        lowerBun.anchor(top: n.bottomAnchor, left: view.leftAnchor ,paddingTop: 8, paddingLeft: 110)
        lowerBun.transform = CGAffineTransform(rotationAngle: -.pi/14)
        
        view.addSubview(whiteDrop)
        whiteDrop.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 100, paddingLeft: 100)
        
        view.addSubview(pinkDrop)
        pinkDrop.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 90, paddingLeft: 100)
    }
}

