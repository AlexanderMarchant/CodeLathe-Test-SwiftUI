//
//  ContentView.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ZStack
            {
                Color.background
                    .ignoresSafeArea()
                
                GiphyView(giphyViewModel: GiphyViewModel(GiphyService(), UrlSessionService()))
                    .configureNavigationBar {
                        $0.navigationBar.tintColor = UIColor.body
                        $0.navigationBar.barTintColor = UIColor.background
                        $0.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "Inter-SemiBold", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.body]
                        $0.navigationBar.shadowImage = UIImage()
                        $0.navigationBar.layer.masksToBounds = false
                        $0.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
                        $0.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
                        $0.navigationBar.layer.shadowRadius = 4
                        $0.navigationBar.layer.shadowOpacity = 0.7
                    }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
