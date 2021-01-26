//
//  AppColours.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import Foundation
import SwiftUI

extension Color {
    
    static var background: Color  {
        return Color("background")
    }
    
    static var body: Color  {
        return Color("body")
    }
    
    static var borders: Color  {
        return Color("borders")
    }
    
    static var codeLathe: Color  {
        return Color("codeLathe")
    }
    
    static var galleryCellBorder: Color  {
        return Color("galleryCellBorder")
    }
    
    static var navigationBarButtonFill: Color  {
        return Color("navigationBarButtonFill")
    }
    
    static var skillCellBackground: Color  {
        return Color("skillCellBackground")
    }
    
}

extension UIColor {
    
    static var background: UIColor  {
        return UIColor(named: "background")!
    }
    
    static var body: UIColor  {
        return UIColor(named: "body")!
    }
    
    static var codeLathe: UIColor  {
        return UIColor(named: "codeLathe")!
    }
    
    static var navigationBarButtonFill: UIColor  {
        return UIColor(named: "navigationBarButtonFill")!
    }
}
