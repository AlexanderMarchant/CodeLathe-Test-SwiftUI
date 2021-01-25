//
//  CLSubHeaderView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct CLSubHeaderView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(Fonts.subHeaderFont)
            .foregroundColor(Color.body)
    }
}

struct CLSubHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CLSubHeaderView(text: "Testing")
    }
}
