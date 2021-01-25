//
//  CLTitleView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct CLTitleView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(Fonts.titleFont)
            .foregroundColor(Color.body)
    }
}

struct CLTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CLTitleView(text: "Testing")
    }
}
