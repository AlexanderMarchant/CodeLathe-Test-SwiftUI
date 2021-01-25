//
//  CLHeaderView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct CLHeaderView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(Fonts.headerFont)
            .foregroundColor(Color.body)
    }
}

struct CLHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CLHeaderView(text: "Testing")
    }
}
