//
//  SkillsTagView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 26/01/2021.
//

import SwiftUI

struct SkillsTagView: View {
    
    var skills: [CandidateSkill]

    @State private var totalHeight
          = CGFloat.zero       // << variant for ScrollView/List
    //    = CGFloat.infinity   // << variant for VStack

    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)// << variant for ScrollView/List
        //.frame(maxHeight: totalHeight) // << variant for VStack
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.skills, id: \.skill) { tag in
                SkillItemView(skill: tag)
                    .padding(.trailing, 15)
                    .padding(.vertical, 10)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag.skill == self.skills.last!.skill {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag.skill  == self.skills.last!.skill  {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
    
}

struct SkillsTagView_Previews: PreviewProvider {
    static var previews: some View {
        SkillsTagView(skills: [
            CandidateSkill(skill: "Test"),
            CandidateSkill(skill: "Test1"),
            CandidateSkill(skill: "Test2"),
            CandidateSkill(skill: "Test3"),
            CandidateSkill(skill: "Test4"),
        ])
    }
}
