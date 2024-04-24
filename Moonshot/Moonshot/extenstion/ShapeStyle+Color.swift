//
//  ShapeStyle+Color.swift
//  Moonshot
//
//  Created by Jastin on 22/4/24.
//

import Foundation
import SwiftUI

extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        return Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground: Color {
        return Color(red: 0.2, green: 0.2, blue: 0.2)
    }
}
