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
                CLTitleTextView(text: "Title")
                CLSubTitleTextView(text: "Sub-Title")
                CLHeaderTextView(text: "Header")
                CLSubHeaderTextView(text: "Sub-Header")
                CLBodyTextView(text: "Body")
                CLCaptionTextView(text: "Caption")
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
