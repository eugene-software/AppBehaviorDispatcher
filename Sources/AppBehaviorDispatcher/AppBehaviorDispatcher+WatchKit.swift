//
//  AppBehaviorDispatcher+AppExtension.swift
//
//  Created by Eugeniy Zaychenko on 11/8/18.
//  Copyright © 2024 Eugeniy Zaychenko. All rights reserved.
//
//  Adapted from: https://github.com/onmyway133/LighterAppDelegate
import UIKit

extension AppBehaviorDispatcher {

    @available(iOS 8.2, *)
    func application(_ application: UIApplication, handleWatchKitExtensionRequest userInfo: [AnyHashable : Any]?, reply: @escaping ([AnyHashable : Any]?) -> Swift.Void) {

        apply({ (behavior, reply) -> Void? in
            behavior.application?(application, handleWatchKitExtensionRequest: userInfo, reply: reply)
        }, completionHandler: { results in
            let result = results.reduce([:], { initial, next in
                var initial = initial
                for (key, value) in next ?? [:] {
                    initial[key] = value
                }
                return initial
            })
            reply(result)
        })
    }
}
