//
//  GalleryItemView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct GalleryItemView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var galleryItemViewModel: GalleryItemViewModel
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .background(Color.background)
                .foregroundColor(Color.background)
                .cornerRadius(5)
                .shadow(color: (colorScheme == .dark ? Color.clear : .init(white: 0.65)), radius: 3, x: 0, y: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.galleryCellBorder, lineWidth: 1)
                )
            
            Image(uiImage: (galleryItemViewModel.displayImageData.isEmpty) ? UIImage(imageLiteralResourceName: "image-not-found") : UIImage(data: galleryItemViewModel.displayImageData)!)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .cornerRadius(5)
        }
        .frame(width: 100, height: 100)
        
    }
}

struct GalleryItemView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryItemView(
            galleryItemViewModel: GalleryItemViewModel(
                galleryItem:
                    GalleryShowcase(
                        displayImageUrl: "https://dailynewsdig.com/wp-content/uploads/2013/12/4.-Just-for-fun......-by-Tony-Antoniou.jpg",
                        title: "Test",
                        description: "Testing",
                        projectLink: "Test",
                        technologiesUsed: ["Test", "Test2", "Test3"],
                        challenges: ["Test", "Test2", "Test3"]),
                UrlSessionService()))
    }
}
