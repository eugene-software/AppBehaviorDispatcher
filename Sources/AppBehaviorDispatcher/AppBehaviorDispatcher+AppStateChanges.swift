//
//  AppBehaviorDispatcher+AppExtension.swift
//
//  Created by Eugeniy Zaychenko on 11/8/18.
//  Copyright © 2024 Eugeniy Zaychenko. All rights reserved.
//
//  Adapted from: https://github.com/onmyway133/LighterAppDelegate

import UIKit

extension AppBehaviorDispatcher {

    @available(iOS 6.0, *)
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        var result = true
        
        for behavior in behaviors {
            if behavior.application?(application, willFinishLaunchingWithOptions: launchOptions) == false {
                result = false
            }
        }
        
        return result
    }

    @available(iOS 2.0, *)
    func applicationDidFinishLaunching(_ application: UIApplication) {
        behaviors.forEach { $0.applicationDidFinishLaunching?(application) }
    }

    @available(iOS 3.0, *)
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        var result = true
        
        for behavior in behaviors {
            if behavior.application?(application, didFinishLaunchingWithOptions: launchOptions) == false {
                result = false
            }
        }
        return result
    }


    @available(iOS 2.0, *)
    func applicationDidBecomeActive(_ application: UIApplication) {
        
        for behavior in behaviors {
            behavior.applicationDidBecomeActive?(application)
        }
    }

    @available(iOS 2.0, *)
    func applicationWillResignActive(_ application: UIApplication) {
        
        for behavior in behaviors {
            behavior.applicationWillResignActive?(application)
        }
    }

    @available(iOS 4.0, *)
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        for behavior in behaviors {
            behavior.applicationDidEnterBackground?(application)
        }
    }

    @available(iOS 4.0, *)
    func applicationWillEnterForeground(_ application: UIApplication) {
        
        for behavior in behaviors {
            behavior.applicationWillEnterForeground?(application)
        }
    }

    @available(iOS 2.0, *)
    func applicationWillTerminate(_ application: UIApplication) {
        
        for behavior in behaviors {
            behavior.applicationWillTerminate?(application)
        }
    }
}
