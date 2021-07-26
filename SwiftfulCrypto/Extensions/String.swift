//
//  String.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/24.
//

import Foundation

extension String {
    func nonZero() -> Bool{
        for i in 0..<self.count {
            if (i != 0 && self[self.index(self.startIndex, offsetBy: i)] != "0") {
                return true
            }
        }
        return false
    }
    
    var removingHTMLOccurences: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "",options: .regularExpression, range: nil)
    }
}
