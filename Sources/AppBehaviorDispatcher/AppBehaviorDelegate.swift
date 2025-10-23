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

open class AppBehaviorDelegate: UIResponder {
    
    open var behaviors: [ApplicationBehavior] {
        fatalError("Should be overriden")
    }
    
    lazy var behaviorDispatcher: AppBehaviorDispatcher = {
        return AppBehaviorDispatcher(behaviors: self.behaviors)
    }()
}


//MARK: - UISceneDelegate
//
@available(iOS 13.0, *)
extension AppBehaviorDelegate: UISceneDelegate {
    
    public func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        behaviorDispatcher.scene(scene, willConnectTo: session, options: connectionOptions)
    }
    
    public func sceneDidDisconnect(_ scene: UIScene) {
        behaviorDispatcher.sceneDidDisconnect(scene)
    }
    
    public func sceneDidBecomeActive(_ scene: UIScene) {
        behaviorDispatcher.sceneDidBecomeActive(scene)
    }
    
    public func sceneWillResignActive(_ scene: UIScene) {
        behaviorDispatcher.sceneWillResignActive(scene)
    }
    
    public func sceneWillEnterForeground(_ scene: UIScene) {
        behaviorDispatcher.sceneWillEnterForeground(scene)
    }
    
    public func sceneDidEnterBackground(_ scene: UIScene) {
        behaviorDispatcher.sceneDidEnterBackground(scene)
    }
    
    public func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        behaviorDispatcher.scene(scene, openURLContexts: URLContexts)
    }
    
    public func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
        behaviorDispatcher.stateRestorationActivity(for: scene)
    }
    
    public func scene(_ scene: UIScene, restoreInteractionStateWith stateRestorationActivity: NSUserActivity) {
        behaviorDispatcher.scene(scene, restoreInteractionStateWith: stateRestorationActivity)
    }
    
    public func scene(_ scene: UIScene, willContinueUserActivityWithType userActivityType: String) {
        behaviorDispatcher.scene(scene, willContinueUserActivityWithType: userActivityType)
    }
    
    public func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        behaviorDispatcher.scene(scene, continue: userActivity)
    }
    
    public func scene(_ scene: UIScene, didFailToContinueUserActivityWithType userActivityType: String, error: any Error) {
        behaviorDispatcher.scene(scene, didFailToContinueUserActivityWithType: userActivityType, error: error)
    }

    public func scene(_ scene: UIScene, didUpdate userActivity: NSUserActivity) {
        behaviorDispatcher.scene(scene, didUpdate: userActivity)
    }
}


//MARK: - UIApplicationDelegate
//
extension AppBehaviorDelegate: UIApplicationDelegate {

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

    @available(iOS 13.2, *)
    public func application(_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
        behaviorDispatcher.application(application, shouldSaveSecureApplicationState: coder)
    }

    @available(iOS 13.2, *)
    public func application(_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
        behaviorDispatcher.application(application, shouldRestoreSecureApplicationState: coder)
    }

    public func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        behaviorDispatcher.application(application, shouldRestoreApplicationState: coder)
    }

    public func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        behaviorDispatcher.application(application, shouldSaveApplicationState: coder)
    }
}


//MARK: - UNUserNotificationCenterDelegate
//
extension AppBehaviorDelegate: UNUserNotificationCenterDelegate {

    //MARK: - UNUserNotificationCenterDelegate
    //
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        behaviorDispatcher.userNotificationCenter(center, didReceive: response, withCompletionHandler: completionHandler)
    }

    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        behaviorDispatcher.userNotificationCenter(center, willPresent: notification, withCompletionHandler: completionHandler)
    }


}
