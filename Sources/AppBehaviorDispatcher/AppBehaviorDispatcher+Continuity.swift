//
//  AppBehaviorDispatcher+AppExtension.swift
//
//  Created by Eugeniy Zaychenko on 11/8/18.
//  Copyright © 2024 Eugeniy Zaychenko. All rights reserved.
//
//  Adapted from: https://github.com/onmyway133/LighterAppDelegate

import UIKit

// Continuing User Activity
extension AppBehaviorDispatcher {

    @available(iOS 8.0, *)
    func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        
        var result = false
        
        for behavior in behaviors {
            if behavior.application?(application, willContinueUserActivityWithType: userActivityType) ?? false {
                result = true
            }
        }
        
        return result
    }

    @available(iOS 8.0, *)
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Swift.Void) -> Bool {
        
        let returns = apply({ (behavior, restorationHandler) -> Bool? in
            behavior.application?(application, continue: userActivity, restorationHandler: restorationHandler)
        }, completionHandler: { results in
            let result = results.reduce([], { $0 + ($1 ?? []) })
            restorationHandler(result)
        })

        return returns.reduce(false, { $0 || $1 })
    }

    @available(iOS 8.0, *)
    func application(_ application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: Error) {
        
        for behavior in behaviors {
            behavior.application?(application, didFailToContinueUserActivityWithType: userActivityType, error: error)
        }
    }

    @available(iOS 8.0, *)
    func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {
        
        for behavior in behaviors {
            behavior.application?(application, didUpdate: userActivity)
        }
    }
}
