//
//  GiphyViewModel.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import Foundation
import SwiftUI

public class GiphyViewModel: ObservableObject {
    
    let urlSessionService: UrlSessionServiceProtocol
    let giphyService: GiphyServiceProtocol
    
    @Published private (set) var showAlert = false
    @Published private (set) var isLoading = false
    
    @Published var gifs = [Gif]()
    
    private (set) var currentSearch: GiphySearch?
    private (set) var currentSearchTerm: String?
    
    init(_ giphyService: GiphyServiceProtocol, _ urlSessionService: UrlSessionServiceProtocol) {
    
        self.giphyService = giphyService
        self.urlSessionService = urlSessionService
        
        getGifs(by: .trending, searchTerm: nil)
    }
    
    func resetAlert() {
        DispatchQueue.main.async {
            self.showAlert = false
        }
    }
    
    func isLoading(_ isLoading: Bool) {
        DispatchQueue.main.async {
            self.isLoading = isLoading
        }
    }
    
    func getGifs(by searchType: GiphySearch, searchTerm: String? = nil) {
        
        resetAlert()
        
        self.gifs = [Gif]()
        self.giphyService.resetTrendingSearch()
        self.giphyService.resetSearchByTermSearch()
        
        switch searchType {
        case .trending:
            self.getTrendingGifs()
        case .bySearchTerm:
            self.getGifsBySearchTerm(userSearch: searchTerm)
        }
    }
    
    func loadNextGifSet() {
        
        resetAlert()
        
        guard let currentSearch = currentSearch else {
            return
        }
        
        switch currentSearch {
        case .bySearchTerm:
            self.getGifsBySearchTerm(userSearch: currentSearchTerm!)
        case .trending:
            self.getTrendingGifs()
        }
    }
    
    private func getGifsBySearchTerm(userSearch: String?) {
        
        guard var search = userSearch else {
            return
        }
        
        search = search.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if(search.isEmpty) {
            return
        }
        
        isLoading(true)
        
        self.currentSearch = .bySearchTerm
        self.currentSearchTerm = search
        
        self.giphyService.getGifsBySearchTerm(search: search, limit: 15) { [weak self] (gifs, error) in
            
            self?.isLoading(false)
            
            if let gifs = gifs,
               error == nil {
                
                let gifs = gifs.data!.map({ x in
                    Gif(
                        gifUrl: x.images!.downsized!.url!,
                        title: x.title ?? "",
                        sourceUrl: x.source ?? "",
                        markedTrending: x.trending_datetime ?? "",
                        username: x.username ?? "")
                })
                
                DispatchQueue.main.async {
                    self?.gifs.append(contentsOf: gifs)
                }
                
            } else {
                // Log the error
                DispatchQueue.main.async {
                    self?.showAlert = true
                }
            }
            
        }
        
    }
    
    private func getTrendingGifs() {
        
        self.currentSearch = .trending
        
        isLoading(true)
        
        self.giphyService.getTrendingGifs(limit: 15) { [weak self] (gifs, error) in
            
            self?.isLoading(false)
            
            if let gifs = gifs,
               error == nil {
                
                let gifs = gifs.data!.map({ x in
                    Gif(
                        gifUrl: x.images!.downsized!.url!,
                        title: x.title ?? "",
                        sourceUrl: x.source ?? "",
                        markedTrending: x.trending_datetime ?? "",
                        username: x.username ?? "")
                })
                
                DispatchQueue.main.async {
                    self?.gifs.append(contentsOf: gifs)
                }
                
            } else {
                // Log the error
                DispatchQueue.main.async {
                    self?.showAlert = true
                }
            }
        }
    }
}
