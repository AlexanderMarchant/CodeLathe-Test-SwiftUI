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
            Section {
                CLTitleView(text: "Title")
                CLSubTitleView(text: "Sub-Title")
                CLHeaderView(text: "Header")
                CLSubHeaderView(text: "Sub-Header")
                CLBodyView(text: "Body")
                CLCaptionView(text: "Caption")
            }
            Section {
                CLPrimaryButton(
                    buttonTitle: "Primary",
                    action: { print("Primary button pressed") })
                
                CLSecondaryButton(
                    buttonTitle: "Secondary",
                    action: { print("Secondary button pressed") })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
