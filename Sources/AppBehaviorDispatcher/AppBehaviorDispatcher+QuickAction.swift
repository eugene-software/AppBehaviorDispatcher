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
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Swift.Void) {
        
        apply({ (behavior, completionHandler) -> Void? in
            behavior.application?(application, performActionFor: shortcutItem, completionHandler: completionHandler)
        }, completionHandler: { results in
            let result = results.reduce(false, { $0 || $1 })
            completionHandler(result)
        })
    }
}
