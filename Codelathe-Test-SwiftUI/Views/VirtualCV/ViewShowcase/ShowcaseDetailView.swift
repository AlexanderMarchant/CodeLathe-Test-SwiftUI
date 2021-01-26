//
//  ShowcaseDetailView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 26/01/2021.
//

import SwiftUI

struct ShowcaseDetailView: View {
    
    @ObservedObject var showcaseDetailViewModel: ShowcaseDetailViewModel
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading, spacing: 25) {
                
                Image(uiImage: (showcaseDetailViewModel.displayImageData.isEmpty) ? UIImage(imageLiteralResourceName: "image-not-found") : UIImage(data: showcaseDetailViewModel.displayImageData)!)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical, 15)
                
                CLHeaderTextView(text: "Description")
                CLBodyTextView(text: showcaseDetailViewModel.showcase.description)
                
                CLHeaderTextView(text: "Technologies")
                
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(showcaseDetailViewModel.showcase.technologiesUsed, id: \String.self) { tech in
                        CLBodyTextView(text: tech)
                    }
                }
                
                CLHeaderTextView(text: "Challenges Faced")
                
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(showcaseDetailViewModel.showcase.challenges, id: \String.self) { challenge in
                        CLBodyTextView(text: challenge)
                    }
                }
                
                CLPrimaryButton(
                    buttonTitle: (showcaseDetailViewModel.showcase.projectLink != nil ? "Take A Look" : "No Project Link"),
                    action: {
                        self.showcaseDetailViewModel.openProjectLink()
                    })
                    .disabled(showcaseDetailViewModel.showcase.projectLink == nil)
            }
            .padding(25)
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationBarTitle(showcaseDetailViewModel.showcase.title)
    }
}

struct ShowcaseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShowcaseDetailView(
            showcaseDetailViewModel: ShowcaseDetailViewModel(
                showcase: GalleryShowcase(
                    displayImageUrl:  "https://dailynewsdig.com/wp-content/uploads/2013/12/4.-Just-for-fun......-by-Tony-Antoniou.jpg",
                    title: "Testing",
                    description: "Testing a long description in preview mode to ensure that it wraps as I am expecting it to. Testing a long description in preview mode to ensure that it wraps as I am expecting it to. Testing a long description in preview mode to ensure that it wraps as I am expecting it to. Testing a long description in preview mode to ensure that it wraps as I am expecting it to. Testing a long description in preview mode to ensure that it wraps as I am expecting it to. Testing a long description in preview mode to ensure that it wraps as I am expecting it to.",
                    projectLink: "https://duckduckgo.com",
                    technologiesUsed: ["Tech", "Tech2", "Tech3"],
                    challenges: ["Challenge", "Challenge2", "Challenge3"]),
                UrlSessionService()))
    }
}
