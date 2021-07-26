//
//  KeyboardViewController.swift
//  SafeKeyboard
//
//  Created by Srikar Nimmagadda on 7/20/21.
//

import UIKit
import AVFoundation

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    var KeySound = URL(fileURLWithPath: Bundle.main.path(forResource: "click", ofType: "wav")!)
    var ErrSound = URL(fileURLWithPath: Bundle.main.path(forResource: "error", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "LoginView", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)
        view = objects[0] as? UIView
        
        makeRoundCorners()
        
//        let tap = UITapGestureRecognizer()
//        tap.numberOfTapsRequired = 2
//        nextKeyboardButton.addGestureRecognizer(tap)
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    @IBAction func buttonPressed(button: UIButton)
    {
        let string = button.titleLabel?.text
        let textbox = (textDocumentProxy.documentContextBeforeInput ?? "") + (textDocumentProxy.documentContextAfterInput ?? "") + (string ?? "")
        
        if isSus(text: textbox)
        {
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: ErrSound)
                audioPlayer.play()
            }
            catch
            {
                //couldn't load file
            }
            var popUpWindow: PopUpWindow!
            popUpWindow = PopUpWindow(title: "Potential Security Breach", text: "Be careful sending that message! It could contain private information.", buttontext: "OK")
            self.present(popUpWindow, animated: true, completion: nil)
        }
        else
        {
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: KeySound)
                audioPlayer.play()
            }
            catch
            {
                //couldn't load file
            }
            textDocumentProxy.insertText("\(string!)")
        }
    }
    
    @IBAction func delPressed(button: UIButton)
    {
        if self.textDocumentProxy.hasText
        {
            self.textDocumentProxy.deleteBackward()
        }
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: KeySound)
            audioPlayer.play()
        }
        catch
        {
            //couldn't load file
        }
    }
    
    @IBAction func spacePressed(button: UIButton)
    {
        self.textDocumentProxy.insertText(" ")
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: KeySound)
            audioPlayer.play()
        }
        catch
        {
            //couldn't load file
        }
    }
    
    @IBAction func numKeyPressed(button: UIButton)
    {
        let nib = UINib(nibName: "NumView", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)
        
        view = objects[0] as? UIView
        
        makeRoundCorners()
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: KeySound)
            audioPlayer.play()
        }
        catch
        {
            //couldn't load file
        }
    }
    
    @IBAction func abcKeyPressed(button: UIButton)
    {
        let nib = UINib(nibName: "KeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)
        
        view = objects[0] as? UIView
        
        makeRoundCorners()
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: KeySound)
            audioPlayer.play()
        }
        catch
        {
            //couldn't load file
        }
    }
    
    @IBAction func charKeyPressed(button: UIButton)
    {
        let nib = UINib(nibName: "CharView", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)
        
        view = objects[0] as? UIView
        
        makeRoundCorners()
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: KeySound)
            audioPlayer.play()
        }
        catch
        {
            //couldn't load file
        }
    }
    
    @IBAction func CapsSinglePressed(button: UIButton)
    {
        let nib = UINib(nibName: "Caps1View", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)
        
        view = objects[0] as? UIView
        
        makeRoundCorners()
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: KeySound)
            audioPlayer.play()
        }
        catch
        {
            //couldn't load file
        }
    }
    
    @IBAction func CapsDoublePressed(button: UIButton)
    {


        let nib = UINib(nibName: "Caps2View", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)

        view = objects[0] as? UIView

        makeRoundCorners()
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: KeySound)
            audioPlayer.play()
        }
        catch
        {
            //couldn't load file
        }
    }
    
    @IBAction func returnPressed(button: UIButton)
    {
        if self.textDocumentProxy.hasText
        {
            let textbox = (textDocumentProxy.documentContextBeforeInput ?? "") + (textDocumentProxy.documentContextAfterInput ?? "")
            
            if isSus(text: textbox)
            {
                var popUpWindow: PopUpWindow!
                popUpWindow = PopUpWindow(title: "Potential Security Breach", text: "Be careful sending: " + textbox, buttontext: "OK")
                self.present(popUpWindow, animated: true, completion: nil)
                }
            else
            {
                print(textbox)
                self.textDocumentProxy.insertText("\n")
            }
        }
        
        self.view.endEditing(true)
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: KeySound)
            audioPlayer.play()
        }
        catch
        {
            //couldn't load file
        }
    }
    
    var keywords = [
        "credit card": 0,
        "social security": 0,
        "address": 0,
        "ip": 0
    ]

    func preCheck(text: String) -> Bool
    {
        var sus = false
        
        var initial: Int
        var textbox: String
        for (e, _) in keywords  {
            textbox = text
            if (textbox.contains(e))  {
                initial = textbox.count
                
                textbox = textbox.replacingOccurrences(of: e, with: "")
                keywords.updateValue((initial - textbox.count) / e.count, forKey: e)
                sus = true
            }
        }
        
        return sus
    }

    func isSus(text: String) -> Bool
    {
        if preCheck(text: text)
        {
            if keywords["credit card"] ?? 0 > 0 && checkRegEx(text: text, pattern: ".*\\d.*")
            {
                if validateCreditCard(text: text.replacingOccurrences(
                        of: "[^\\d]", with: "", options: .regularExpression,
                        range: text.startIndex..<text.endIndex))
                {
                    return true
                }
            }
            if keywords["social security"] ?? 0 > 0 && checkRegEx(text: text, pattern: ".*\\d.*")
            {
                if validateSocialSecurity(text: text.replacingOccurrences(
                        of: "[^\\d-]", with: "", options: .regularExpression,
                        range: text.startIndex..<text.endIndex))
                {
                    return true
                }
            }
            if keywords["ip"] ?? 0 > 0 && checkRegEx(text: text, pattern: ".*\\d.*")
            {
                if validateIP(text: text.replacingOccurrences(
                        of: "[^\\d.]", with: "", options: .regularExpression,
                        range: text.startIndex..<text.endIndex))
                {
                    return true
                }
            }
            if keywords["address"] ?? 0 > 0 && checkRegEx(text: text, pattern: ".*\\d.*")
            {
                return true
            }
        }
        return false
    }

    func validateCreditCard(text: String) -> Bool
    {
        let nDigits = text.count
        
        var nSum = 0
        var isSecond = false
        let textbox = text
        
        for i in stride(from: nDigits-1, to: -1, by: -1)
        {
            var d = Int(textbox[i]) ?? 0
            
            if isSecond == true
            {
                d = d * 2
            }
            
            nSum += d / 10
            nSum += d % 10
            
            isSecond = !isSecond;
        }
        
        return (nSum % 10 == 0);
    }
    
    func validateSocialSecurity(text: String) -> Bool
    {
        let pattern = "^(?!000|666)[0-8][0-9]{2}-(?!00)[0-9]{2}-(?!0000)[0-9]{4}$"
        return checkRegEx(text: text, pattern: pattern)
    }
    
    func validateIP(text: String) -> Bool
    {
        let pattern = "^((0|1\\d?\\d?|2[0-4]?\\d?|25[0-5]?|[3-9]\\d?)\\.){3}(0|1\\d?\\d?|2[0-4]?\\d?|25[0-5]?|[3-9]\\d?)$"
        return checkRegEx(text: text, pattern: pattern)
    }
    
    func checkRegEx(text: String, pattern: String) -> Bool
    {
        return text.range(of: pattern, options: .regularExpression) != nil
    }
    
    func makeRoundCorners()
    {
        for button in self.view.subviews
        {
            if button is UIButton{
                button.layer.cornerRadius = 5
                button.layer.masksToBounds = true
                
            }
        }
    }

}

extension String
{

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
