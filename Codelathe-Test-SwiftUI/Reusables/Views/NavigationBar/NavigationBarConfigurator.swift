//
//  NavigationBarConfigurator.swift
//  Codelathe-Test-SwiftUI
//
//  Created by Alex Marchant on 26/01/2021.
//

import Foundation
import SwiftUI
import UIKit

extension View {
    func configureNavigationBar(configure: @escaping (UINavigationController) -> Void) -> some View {
        modifier(NavigationConfigurationViewModifier(configure: configure))
    }
}

struct NavigationConfigurationViewModifier: ViewModifier {
    let configure: (UINavigationController) -> Void
    
    init(configure: @escaping((UINavigationController) -> Void)) {
        
        self.configure = configure
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Inter-SemiBold", size: 18)!,
            NSAttributedString.Key.foregroundColor: UIColor.body
        ]
        coloredAppearance.backgroundColor = UIColor.background
        coloredAppearance.backgroundImage = UIImage()
        coloredAppearance.shadowImage = UIImage()
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        
    }

    func body(content: Content) -> some View {
        content.background(NavigationConfigurator(configure: configure))
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    let configure: (UINavigationController) -> Void

    func makeUIViewController(
        context: UIViewControllerRepresentableContext<NavigationConfigurator>
    ) -> NavigationConfigurationViewController {
        NavigationConfigurationViewController(configure: configure)
    }

    func updateUIViewController(
        _ uiViewController: NavigationConfigurationViewController,
        context: UIViewControllerRepresentableContext<NavigationConfigurator>
    ) { }
}

final class NavigationConfigurationViewController: UIViewController {
    let configure: (UINavigationController) -> Void

    init(configure: @escaping (UINavigationController) -> Void) {
        self.configure = configure
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let navigationController = navigationController {
            configure(navigationController)
        }
    }
}
