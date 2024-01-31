//
//  AppBehaviorDispatcher+AppExtension.swift
//
//  Created by Eugeniy Zaychenko on 11/8/18.
//  Copyright © 2024 Eugeniy Zaychenko. All rights reserved.
//
//  Adapted from: https://github.com/onmyway133/LighterAppDelegate

import UIKit

extension AppBehaviorDispatcher {

    @available(iOS 4.0, *)
    func applicationProtectedDataWillBecomeUnavailable(_ application: UIApplication) {
        
        for behavior in behaviors {
            behavior.applicationProtectedDataWillBecomeUnavailable?(application)
        }
    }

    @available(iOS 4.0, *)
    func applicationProtectedDataDidBecomeAvailable(_ application: UIApplication) {
        
        for behavior in behaviors {
            behavior.applicationProtectedDataDidBecomeAvailable?(application)
        }
    }

    @available(iOS 2.0, *)
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        
        for behavior in behaviors {
            behavior.applicationDidReceiveMemoryWarning?(application)
        }
    }

    @available(iOS 2.0, *)
    func applicationSignificantTimeChange(_ application: UIApplication) {
        
        for behavior in behaviors {
            behavior.applicationSignificantTimeChange?(application)
        }
    }
}
