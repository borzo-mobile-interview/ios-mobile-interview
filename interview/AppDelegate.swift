//
//  AppDelegate.swift
//  interview
//
//  Created by Boris Bengus on 18/02/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private lazy var di: DIContainerProtocol = DefaultDIContainer()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Design.applyAppearance()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let rootModuleAssembly = di.getRootModuleAssembly()
        let rootModule = rootModuleAssembly.module(moduleSeed: RootModuleSeed())
        rootModule.moduleInput.start(navigationController: navigationController)
        
        return true
    }
}

