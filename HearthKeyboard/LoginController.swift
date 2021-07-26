//
//  LoginController.swift
//  HearthKeyboard
//
//  Created by Srikar Nimmagadda on 7/25/21.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailLine: UIView!
    @IBOutlet weak var emailSymb: UIImageView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordLine: UIView!
    @IBOutlet weak var passwordSymb: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcome.numberOfLines = 0
        
        let emailStartText = NSAttributedString(string: "Email",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#AAAAAA")])
        
        let passwordStartText = NSAttributedString(string: "Password",
                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#AAAAAA")])
                
        emailField.attributedPlaceholder = emailStartText
        passwordField.attributedPlaceholder = passwordStartText
        
        emailField.autocorrectionType = .no
        passwordField.autocorrectionType = .no
        
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
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
