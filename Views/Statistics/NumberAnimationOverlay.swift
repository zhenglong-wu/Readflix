//
//  NumberAnimationOverlay.swift
//  Readflix
//
//  Created by Zhenglong Wu on 08/12/2021.
//

import SwiftUI
import Foundation

struct NumberAnimationOverlay: AnimatableModifier {
        
    var number: CGFloat
    
    var animatableData: CGFloat {
        get {
            number
        }
        set {
            number = newValue
        }
    }
    
    func body(content: Content) -> some View {
        return content.overlay(Text("\(Int(number))").bold().font(.title2))
    }
}


