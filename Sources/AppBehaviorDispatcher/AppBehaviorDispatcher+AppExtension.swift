//
//  AppBehaviorDispatcher+AppExtension.swift
//
//  Created by Eugeniy Zaychenko on 11/8/18.
//  Copyright © 2024 Eugeniy Zaychenko. All rights reserved.
//
//  Adapted from: https://github.com/onmyway133/LighterAppDelegate

import UIKit

extension AppBehaviorDispatcher {

    @available(iOS 8.0, *)
    func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
        
        var result = false
        
        for behavior in behaviors {
            if behavior.application?(application, shouldAllowExtensionPointIdentifier: extensionPointIdentifier) ?? true {
                result = true
            }
        }
        
        return result
    }
}
