//
//  HapticManager.swift
//  SwiftfulCrypto
//
//  Created by Shaw Young on 2021/7/23.
//

import Foundation
import SwiftUI

class HapticManager {

    static private let generator = UINotificationFeedbackGenerator()

    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
