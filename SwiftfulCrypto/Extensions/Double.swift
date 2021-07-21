//
//  Double.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/20.
//

import Foundation

extension Double {
   
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        // formatter.locale = .current // <- default value
        // formatter.currencyCode = "USD" // <- change currency
        // formatter.currencySymbol = "$" // <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    ///Converts a Double into a Currency with 2 decimal places
    ///```
    ///Convert 1234.56 to "$1,234.56"
    ///Convert 12.3456 to "$12.3456"
    ///Convert 0.123456 to "$0.123456"
    ///```
    
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        // formatter.locale = .current // <- default value
        // formatter.currencyCode = "USD" // <- change currency
        // formatter.currencySymbol = "$" // <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    ///Converts a Double into a Currency with 2-6 decimal places
    ///```
    ///Convert 1234.56 to "$1,234.56"
    ///```
    
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    
    ///```
    ///Convert 1.23456 to "1.23"
    ///```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    ///```
    ///Convert "1.23" to "1.23%"
    ///```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}