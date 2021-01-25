//
//  CLCaptionView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct CLCaptionTextView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(Fonts.captionFont)
            .foregroundColor(Color.body)
    }
}

struct CLCaptionView_Previews: PreviewProvider {
    static var previews: some View {
        CLCaptionTextView(text: "Testing")
    }
}
