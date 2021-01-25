//
//  CLSecondaryButton.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct CLSecondaryButton: View {
    
    var buttonTitle: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            
            HStack {
                Text(buttonTitle)
                    .font(Fonts.buttonFont)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(Color.codeLathe)
            .background(Color.clear)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.codeLathe, lineWidth: 2)
            )
        })
        
    }
}

struct CLSecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        CLSecondaryButton(
            buttonTitle: "Testing",
            action: { print("You pressed me") })
    }
}
