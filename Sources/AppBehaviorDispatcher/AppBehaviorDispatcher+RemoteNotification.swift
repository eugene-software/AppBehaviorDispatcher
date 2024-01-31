//
//  AppBehaviorDispatcher+AppExtension.swift
//
//  Created by Eugeniy Zaychenko on 11/8/18.
//  Copyright © 2024 Eugeniy Zaychenko. All rights reserved.
//
//  Adapted from: https://github.com/onmyway133/LighterAppDelegate

import UIKit

extension AppBehaviorDispatcher {

    @available(iOS 3.0, *)
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        for behavior in behaviors {
            behavior.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
        }
    }

    @available(iOS 3.0, *)
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        for behavior in behaviors {
            behavior.application?(application, didFailToRegisterForRemoteNotificationsWithError: error)
        }
    }

    @available(iOS 7.0, *)
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Swift.Void) {
        
        apply({ (behavior, completionHandler) -> Void? in
            behavior.application?(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
        }, completionHandler: { results in
            let result = results.min(by: { $0.rawValue < $1.rawValue }) ?? .noData
            completionHandler(result)
        })
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        for behavior in behaviors {
            behavior.userNotificationCenter?(center, didReceive: response, withCompletionHandler: completionHandler)
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        for behavior in behaviors {
            behavior.userNotificationCenter?(center, willPresent: notification, withCompletionHandler: completionHandler)
        }
    }
}
