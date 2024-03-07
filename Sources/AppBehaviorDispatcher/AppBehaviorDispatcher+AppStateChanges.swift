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
