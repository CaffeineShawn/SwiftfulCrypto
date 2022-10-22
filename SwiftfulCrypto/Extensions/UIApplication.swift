//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/22.
//

import Foundation
import SwiftUI

extension UIApplication {

    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
