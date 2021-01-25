//
//  CLSubTitleView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct CLSubTitleView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(Fonts.subTitleFont)
            .foregroundColor(Color.body)
    }
}

struct CLSubTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CLSubTitleView(text: "Testing")
    }
}
