//
//  AppBehaviorDispatcher+AppExtension.swift
//
//  Created by Eugeniy Zaychenko on 11/8/18.
//  Copyright © 2024 Eugeniy Zaychenko. All rights reserved.
//
//  Adapted from: https://github.com/onmyway133/LighterAppDelegate

import UIKit
import UserNotifications

public protocol ApplicationBehavior: UIApplicationDelegate, UNUserNotificationCenterDelegate { }

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
