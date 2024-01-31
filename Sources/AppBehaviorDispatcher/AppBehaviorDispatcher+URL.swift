//
//  AppBehaviorDispatcher+AppExtension.swift
//
//  Created by Eugeniy Zaychenko on 11/8/18.
//  Copyright © 2024 Eugeniy Zaychenko. All rights reserved.
//
//  Adapted from: https://github.com/onmyway133/LighterAppDelegate

import UIKit

extension AppBehaviorDispatcher {

    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        var result = false
        
        for behavior in behaviors {
            if behavior.application?(app, open: url, options: options) ?? false {
                result = true
            }
        }
        
        return result
    }
}
