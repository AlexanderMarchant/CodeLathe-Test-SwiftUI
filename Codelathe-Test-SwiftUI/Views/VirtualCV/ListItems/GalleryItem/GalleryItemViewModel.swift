//
//  GalleryItemViewModel.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import Foundation
import SwiftUI

public class GalleryItemViewModel: ObservableObject {
    
    let galleryItem: GalleryShowcase
    let urlSessionService: UrlSessionServiceProtocol
    
    @Published var displayImageData = Data()
    
    init(
        galleryItem: GalleryShowcase,
        _ urlSessionService: UrlSessionServiceProtocol) {
        
        self.galleryItem = galleryItem
        self.urlSessionService = urlSessionService
        
        downloadProjectImage()
        
    }
    
    func downloadProjectImage() {
        
        guard let url = URL(string: self.galleryItem.displayImageUrl) else {
            print("No display image url...")
            return
        }
        
        urlSessionService.downloadImage(from: url) { (data, response, error) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.displayImageData = data
            }
        }
    }
}
