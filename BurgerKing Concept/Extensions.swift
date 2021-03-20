//
//  Extensions.swift
//  TableView Animation
//
//  Created by Rachit Prajapati on 14/03/21.
//

import UIKit

//MARK: - UIView

extension UIView {
   func anchor(top: NSLayoutYAxisAnchor? = nil,
               left: NSLayoutXAxisAnchor? = nil,
               bottom: NSLayoutYAxisAnchor? = nil,
               right: NSLayoutXAxisAnchor? = nil,
               paddingTop: CGFloat = 0,
               paddingLeft: CGFloat = 0,
               paddingBottom: CGFloat = 0,
               paddingRight: CGFloat = 0,
               width: CGFloat? = nil,
               height: CGFloat? = nil) {
       
       translatesAutoresizingMaskIntoConstraints = false
       
       if let top = top {
           topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
       }
       
       if let left = left {
           leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
       }
       
       if let bottom = bottom {
           bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
       }
       
       if let right = right {
           rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
       }
       
       if let width = width {
           widthAnchor.constraint(equalToConstant: width).isActive = true
       }
       
       if let height = height {
           heightAnchor.constraint(equalToConstant: height).isActive = true
       }
   }
   
   func center(inView view: UIView, yConstant: CGFloat? = 0) {
       translatesAutoresizingMaskIntoConstraints = false
       centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
   }
   
   func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
       translatesAutoresizingMaskIntoConstraints = false
       centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
       if let topAnchor = topAnchor {
           self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
       }
   }
   
   func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat? = nil, constant: CGFloat? = 0) {
       translatesAutoresizingMaskIntoConstraints = false
       
       centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant!).isActive = true
       
       if let leftAnchor = leftAnchor, let padding = paddingLeft {
           self.leftAnchor.constraint(equalTo: leftAnchor, constant: padding).isActive = true
       }
   }
   
   func setDimensions(width: CGFloat, height: CGFloat) {
       translatesAutoresizingMaskIntoConstraints = false
       widthAnchor.constraint(equalToConstant: width).isActive = true
       heightAnchor.constraint(equalToConstant: height).isActive = true
   }
   
   func addConstraintsToFillView(_ view: UIView) {
       translatesAutoresizingMaskIntoConstraints = false
       anchor(top: view.topAnchor, left: view.leftAnchor,
              bottom: view.bottomAnchor, right: view.rightAnchor)
   }
   
   func createContainer(image: UIImage?, textField: UITextField) -> UIView {
       let view = UIView()
       
       let imageView = UIImageView()
       imageView.image = image
       view.addSubview(imageView)
       imageView.centerY(inView: view)
       imageView.anchor(left: view.leftAnchor, paddingLeft: 8, width: 24, height: 24)
       
       view.addSubview(textField)
       textField.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
       textField.centerY(inView: view)
       
       let seperatorView = UIView()
       seperatorView.backgroundColor = .lightGray
       view.addSubview(seperatorView)
       seperatorView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, height: 0.75)
       return view
       
       
       
   }
   
   
}

//MARK: - TextField

extension UITextField  {
   
   func createTextField(placeholder: String, isSecureTextEntry: Bool) -> UITextField {
       let tf = UITextField()
       tf.borderStyle = .none
       tf.font = UIFont.systemFont(ofSize: 16)
       tf.textColor = .systemGray
       tf.keyboardAppearance = .light
       tf.autocorrectionType = .no
       tf.autocapitalizationType = .none
       tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray])
       tf.isSecureTextEntry = false
       return tf
   }
}

// MARK: - UIColor

extension UIColor {
   static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
       return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
   }
   
   static let twitterBlue = UIColor.rgb(red: 29, green: 161, blue: 242)
}

//MARK: - UIButton

extension UIButton {
   func makeBlackBackgroundButton(title: String) -> UIButton {
           let button = UIButton(type: .system)
           button.setTitle(title, for: .normal)
           button.setTitleColor(.white, for: .normal)
           button.backgroundColor = .black
           button.layer.cornerRadius = 15
           button.anchor(width: 65, height: 32)
           button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
           return button
      
   }
   
   func createActionButton(image: UIImage?) -> UIButton {
       let button = UIButton(type: .system)
       button.setImage(image, for: .normal)
       button.setDimensions(width: 30, height: 30)
       return button
   }
   

}




//MARK: - UILabel

extension UILabel {
   
   func topLabel(title: String, weight: UIFont.Weight) -> UILabel {
       let label = UILabel()
       label.text = title
       label.font = UIFont.systemFont(ofSize: 20, weight: weight)
       label.textColor = UIColor.black
       label.contentMode = .scaleAspectFit
       return label
   }
    
    
    func createLabel(text: String, color: UIColor, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.font = UIFont(name: "HelveticaNeue-CondensedBold", size: size)
        return label
    }
   
   
   
}

//MARK: - UIImageView
extension UIImageView {
   func createProfileImageView(width: CGFloat, height: CGFloat) -> UIImageView {
       let pv = UIImageView()
       pv.contentMode = .scaleAspectFill
       pv.layer.masksToBounds = true
       pv.clipsToBounds = true
       pv.backgroundColor = .lightGray
       pv.setDimensions(width: width, height: height)
       pv.layer.cornerRadius = width / 2
       return pv
   }
}






