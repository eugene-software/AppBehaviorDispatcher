//
//  AppBehaviorDispatcher+AppExtension.swift
//
//  Created by Eugeniy Zaychenko on 11/8/18.
//  Copyright © 2024 Eugeniy Zaychenko. All rights reserved.
//
//  Adapted from: https://github.com/onmyway133/LighterAppDelegate

import UIKit

open class AppBehaviorDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    open var behaviors: [ApplicationBehavior] {
        fatalError("Should be overriden")
    }
    
    lazy var behaviorDispatcher: AppBehaviorDispatcher = {
        return AppBehaviorDispatcher(behaviors: self.behaviors)
    }()
    
    
    //MARK: - UIApplicationDelegate
    //
    public func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return behaviorDispatcher.application(application, willFinishLaunchingWithOptions: launchOptions)
    }
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return behaviorDispatcher.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    public func applicationDidBecomeActive(_ application: UIApplication) {
        return behaviorDispatcher.applicationDidBecomeActive(application)
    }
    
    public func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        return behaviorDispatcher.application(application, continue: userActivity, restorationHandler:restorationHandler)
    }
    
    public func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return behaviorDispatcher.application(app, open: url, options: options)
    }
    
    public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        behaviorDispatcher.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    public func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        behaviorDispatcher.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
    }
    
    public func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        behaviorDispatcher.application(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
    }
    
    public func application(_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
        behaviorDispatcher.application(application, shouldSaveSecureApplicationState: coder)
    }
    
    public func application(_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
        behaviorDispatcher.application(application, shouldRestoreSecureApplicationState: coder)
    }
    
    
    //MARK: - UNUserNotificationCenterDelegate
    //
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        behaviorDispatcher.userNotificationCenter(center, didReceive: response, withCompletionHandler: completionHandler)
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        behaviorDispatcher.userNotificationCenter(center, willPresent: notification, withCompletionHandler: completionHandler)
    }
}

