//
//  CLBodyView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct CLBodyView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(Fonts.bodyFont)
            .foregroundColor(Color.body)
    }
}

struct CLBodyView_Previews: PreviewProvider {
    static var previews: some View {
        CLBodyView(text: "Testing")
    }
}
