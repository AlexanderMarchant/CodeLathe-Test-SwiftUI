//
//  AppDelegate.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 25/01/2021.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()

        let attrs: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Inter-SemiBold", size: 30)!
        ]

        appearance.largeTitleTextAttributes = attrs

        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        
        return true
    }
    
}
