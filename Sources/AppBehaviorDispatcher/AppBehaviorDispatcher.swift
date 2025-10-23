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
import UserNotifications

public protocol ApplicationBehavior: UIApplicationDelegate, UNUserNotificationCenterDelegate, UISceneDelegate { }

public class AppBehaviorDispatcher {

    public let behaviors: [ApplicationBehavior]

    public init(behaviors: [ApplicationBehavior]) {
        self.behaviors = behaviors
    }

    @discardableResult
    internal func apply<T, B>(_ work: (ApplicationBehavior, @escaping (T) -> Void) -> B?, completionHandler: @escaping ([T]) -> Void) -> [B] {
        
        let dispatchGroup = DispatchGroup()
        var results: [T] = []
        var returns: [B] = []

        for behavior in behaviors {
            dispatchGroup.enter()
            let returned = work(behavior, { result in
                results.append(result)
                dispatchGroup.leave()
            })
            if let returned = returned {
                returns.append(returned)
            } else { // delegate doesn't impliment method
                dispatchGroup.leave()
            }
        }

        dispatchGroup.notify(queue: .main) {
            completionHandler(results)
        }

        return returns
    }
}
