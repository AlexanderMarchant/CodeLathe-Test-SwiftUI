//
//  CLPrimaryButton.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct CLPrimaryButton: View {
    
    var buttonTitle: String
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action, label: {
            
            HStack {
                Text(buttonTitle)
                    .font(Fonts.buttonFont)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(Color.codeLathe)
            .foregroundColor(Color.white)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.codeLathe, lineWidth: 2)
            )
        })
    }
}

struct CLPrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        CLPrimaryButton(
            buttonTitle: "Testing",
            action: { print("You pressed me") })
    }
}
