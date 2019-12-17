//
//  SceneDelegate.swift
//  Test
//
//  Created by Tibor Bodecs on 2019. 12. 15..
//  Copyright © 2019. Tibor Bodecs. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder {

    var window: UIWindow?   
}

extension SceneDelegate: UIWindowSceneDelegate {

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        let window = UIWindow(windowScene: windowScene)
        let processInfo = ProcessInfo.processInfo
        var moduleName = "Main"
        if processInfo.arguments.contains("-test") {
            UIView.setAnimationsEnabled(false)
            window.layer.speed = 100
            if let name = processInfo.environment["module"] {
                moduleName = name
            }
        }
        window.rootViewController = UIStoryboard(name: moduleName, bundle: nil).instantiateInitialViewController()
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}

