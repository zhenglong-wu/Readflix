//
//  HapticsManager.swift
//  Readflix
//
//  Created by Zhenglong Wu on 06/12/2021.
//

import Foundation
import CoreHaptics
import SwiftUI

class HapticsManager {
    
    private let generator = UINotificationFeedbackGenerator()
    
    func createHeavyHaptic() {
        let hapticFeedback = UIImpactFeedbackGenerator(style: .heavy)
        hapticFeedback.impactOccurred()
    }
    
    func createMediumHaptic() {
        let hapticFeedback = UIImpactFeedbackGenerator(style: .medium)
        hapticFeedback.impactOccurred()
    }
    
    func createLightHaptic() {
        let hapticFeedback = UIImpactFeedbackGenerator(style: .light)
        hapticFeedback.impactOccurred()
    }
    
    func createSuccessHaptic() {
        generator.notificationOccurred(.success)
    }
    
    func createWarningHaptic() {
        generator.notificationOccurred(.warning)
    }
    
    func creatErrorHaptic() {
        generator.notificationOccurred(.error)
    }
    
}

