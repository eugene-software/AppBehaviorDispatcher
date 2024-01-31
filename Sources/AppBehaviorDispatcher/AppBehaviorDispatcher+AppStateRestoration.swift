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
    func application(_ application: UIApplication, viewControllerWithRestorationIdentifierPath identifierComponents: [String], coder: NSCoder) -> UIViewController? {
        
        for behavior in behaviors {
            if let viewController = behavior.application?(application, viewControllerWithRestorationIdentifierPath: identifierComponents, coder: coder) {
                return viewController
            }
        }
        
        return nil
    }
    
    func application(_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
        var result = false
        
        for behavior in behaviors {
            if behavior.application?(application, shouldSaveSecureApplicationState: coder) ?? false {
                result = true
            }
        }
        
        return result
    }
    
    func application(_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
        var result = false
        for behavior in behaviors {
            if behavior.application?(application, shouldRestoreSecureApplicationState: coder) ?? false {
                result = true
            }
        }
        
        return result
    }

    @available(iOS 6.0, *)
    func application(_ application: UIApplication, willEncodeRestorableStateWith coder: NSCoder) {
        
        for behavior in behaviors {
            behavior.application?(application, willEncodeRestorableStateWith: coder)
        }
    }

    @available(iOS 6.0, *)
    func application(_ application: UIApplication, didDecodeRestorableStateWith coder: NSCoder) {
        
        for behavior in behaviors {
            behavior.application?(application, didDecodeRestorableStateWith: coder)
        }
    }
}
