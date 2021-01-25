//
//  ContentView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Form {
            Text("Title Font")
                .font(Fonts.titleFont)
                .padding()
            Text("SubTitle Font")
                .font(Fonts.subTitleFont)
                .padding()
            Text("Header Font")
                .font(Fonts.headerFont)
                .padding()
            Text("Sub-Header Font")
                .font(Fonts.subHeaderFont)
                .padding()
            Text("Body Font")
                .font(Fonts.bodyFont)
                .padding()
            Text("Button Font")
                .font(Fonts.buttonFont)
                .padding()
            Text("Caption Font")
                .font(Fonts.captionFont)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
