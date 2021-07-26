//
//  Checker.swift
//  SafeKeyboard
//
//  Created by Srikar Nimmagadda on 7/21/21.
//

import Foundation

class Checker
{
//    var keywords = [
//        "credit card": 0,
//        "social security": 0,
//        "address": 0,
//        "ip": 0
//    ]
//
//    func preCheck(text: String) -> Bool
//    {
//        var sus = false
//
//        var initial: Int
//        var textbox: String
//        for (e, _) in keywords  {
//            textbox = text
//            if (textbox.contains(e))  {
//                initial = textbox.count
//
//                textbox = textbox.replacingOccurrences(of: e, with: "")
//                keywords.updateValue((initial - textbox.count) / e.count, forKey: e)
//                sus = true
//            }
//        }
//
//        print(keywords, sus)
//        return sus
//    }
//
//    func isSus(text: String) -> Bool
//    {
//        if preCheck(text: text)
//        {
//            if keywords["credit card"] ?? 0 > 0 && checkRegEx(text: text, pattern: ".*\\d.*")
//            {
//                print(validateCreditCard(text: text.replacingOccurrences(
//                        of: "[^\\d-]", with: "", options: .regularExpression,
//                        range: text.startIndex..<text.endIndex)))
//            }
//        }
//        return false
//    }
//
//    func checkRegEx(text: String, pattern: String) -> Bool
//    {
//        let regex = try! NSRegularExpression(pattern: ".*\\d.*")
//        let range = NSRange(location: 0, length: text.utf16.count)
//        return regex.firstMatch(in: text, range: range) != nil
//    }
//
//    func validateCreditCard(text: String) -> Bool
//    {
//        let nDigits = text.count
//
//        var nSum = 0
//        var isSecond = false
//        let textbox = text
//
//        for i in stride(from: nDigits-1, to: -1, by: -1)
//        {
//            var d = Int(textbox[i]) ?? 0
//
//            if isSecond == true
//            {
//                d = d * 2
//            }
//
//            nSum += d / 10
//            nSum += d % 10
//
//            isSecond = !isSecond;
//        }
//
//        return (nSum % 10 == 0);
//    }
}


