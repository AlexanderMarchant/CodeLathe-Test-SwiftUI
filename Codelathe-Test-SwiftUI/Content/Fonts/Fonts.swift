//
//  Fonts.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import Foundation
import SwiftUI

struct Fonts {
    
    static var titleFont: Font {
        return Font.custom("Inter-Bold", size: 26)
    }
    
    static var subTitleFont: Font {
        return Font.custom("Inter-SemiBold", size: 22)
    }
    
    static var headerFont: Font {
        return Font.custom("Inter-SemiBold", size: 18)
    }
    
    static var subHeaderFont: Font {
        return Font.custom("Inter-Medium", size: 16)
    }
    
    static var buttonFont: Font {
        return Font.custom("Inter-SemiBold", size: 18)
    }
    
    static var bodyFont: Font {
        return Font.custom("Inter-Regular", size: 16)
    }
    
    static var captionFont: Font {
        return Font.custom("Inter-Regular", size: 14)
    }
}
