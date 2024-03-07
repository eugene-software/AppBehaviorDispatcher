//
//  AppBehaviorDispatcher+AppExtension.swift
//  AppBehaviorDispatcher
//
//  Created by Eugene Software on 07/03/24.
//
//  Copyright (c) 2024 Eugene Software
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
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
