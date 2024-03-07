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
    
    @available(iOS 13.2, *)
    func application(_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
        var result = false
        
        for behavior in behaviors {
            if behavior.application?(application, shouldSaveSecureApplicationState: coder) ?? false {
                result = true
            }
        }
        
        return result
    }
    
    @available(iOS 13.2, *)
    func application(_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
        var result = false
        for behavior in behaviors {
            if behavior.application?(application, shouldRestoreSecureApplicationState: coder) ?? false {
                result = true
            }
        }
        
        return result
    }
    
    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        var result = false
        
        for behavior in behaviors {
            if behavior.application?(application, shouldSaveApplicationState: coder) ?? false {
                result = true
            }
        }
        
        return result
    }
    
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        var result = false
        for behavior in behaviors {
            if behavior.application?(application, shouldRestoreApplicationState: coder) ?? false {
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
