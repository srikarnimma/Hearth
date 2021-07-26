//
//  LoginController.swift
//  HearthKeyboard
//
//  Created by Srikar Nimmagadda on 7/25/21.
//

import UIKit

class SignupController: UIViewController {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailLine: UIView!
    @IBOutlet weak var emailSymb: UIImageView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLine: UIView!
    @IBOutlet weak var passwordSymb: UIImageView!
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var userLine: UIView!
    @IBOutlet weak var userSymb: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcome.numberOfLines = 0
        
        let emailStartText = NSAttributedString(string: "Email",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#AAAAAA")])
        
        let passwordStartText = NSAttributedString(string: "Password",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#AAAAAA")])
        let userStartText = NSAttributedString(string: "Username",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#AAAAAA")])
                
        emailField.attributedPlaceholder = emailStartText
        passwordField.attributedPlaceholder = passwordStartText
        userField.attributedPlaceholder = userStartText
        
        emailField.autocorrectionType = .no
        passwordField.autocorrectionType = .no
        userField.autocorrectionType = .no
        
        
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -50
        horizontalMotionEffect.maximumRelativeValue = 50

        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -50
        verticalMotionEffect.maximumRelativeValue = 50

        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [horizontalMotionEffect, verticalMotionEffect]

        background.addMotionEffect(motionEffectGroup)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func emailFieldPressed(emailField: UITextField)
    {
        let myColor = UIColor(hexString: "#FF9D3A")
        emailField.textColor = myColor
        emailSymb.tintColor = myColor
        emailLine.backgroundColor = myColor
    }
    
    @IBAction func emailFieldReleased(emailField: UITextField)
    {
        let myColor = UIColor(hexString: "#AAAAAA")
        emailField.textColor = myColor
        emailSymb.tintColor = myColor
        emailLine.backgroundColor = myColor
    }
    
    @IBAction func passwordFieldPressed(emailField: UITextField)
    {
        let myColor = UIColor(hexString: "#FF9D3A")
        passwordField.textColor = myColor
        passwordSymb.tintColor = myColor
        passwordLine.backgroundColor = myColor
    }
    
    @IBAction func passwordFieldReleased(emailField: UITextField)
    {
        let myColor = UIColor(hexString: "#AAAAAA")
        passwordField.textColor = myColor
        passwordSymb.tintColor = myColor
        passwordLine.backgroundColor = myColor
    }
    
    @IBAction func userFieldPressed(emailField: UITextField)
    {
        let myColor = UIColor(hexString: "#FF9D3A")
        userField.textColor = myColor
        userSymb.tintColor = myColor
        userLine.backgroundColor = myColor
    }
    
    @IBAction func userFieldReleased(emailField: UITextField)
    {
        let myColor = UIColor(hexString: "#AAAAAA")
        userField.textColor = myColor
        userSymb.tintColor = myColor
        userLine.backgroundColor = myColor
    }
}

