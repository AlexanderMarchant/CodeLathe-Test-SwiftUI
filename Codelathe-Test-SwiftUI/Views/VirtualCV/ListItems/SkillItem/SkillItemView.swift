//
//  SkillItemView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct SkillItemView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var skill: CandidateSkill
    
    var body: some View {
        Text(skill.skill)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .font(Fonts.headerFont)
            .background(Color.skillCellBackground)
            .foregroundColor(.white)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.skillCellBackground)
            )
            .shadow(color: (colorScheme == .dark ? Color.clear : Color.gray), radius: 5, x: 0, y: 3)
    }
}

struct SkillItemView_Previews: PreviewProvider {
    static var previews: some View {
        SkillItemView(skill: CandidateSkill(skill: "Test"))
    }
}
