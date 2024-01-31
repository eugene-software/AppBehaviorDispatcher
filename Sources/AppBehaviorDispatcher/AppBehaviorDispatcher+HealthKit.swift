//
//  AppBehaviorDispatcher+AppExtension.swift
//
//  Created by Eugeniy Zaychenko on 11/8/18.
//  Copyright © 2024 Eugeniy Zaychenko. All rights reserved.
//
//  Adapted from: https://github.com/onmyway133/LighterAppDelegate

import UIKit

extension AppBehaviorDispatcher {

    @available(iOS 9.0, *)
    func applicationShouldRequestHealthAuthorization(_ application: UIApplication) {
        
        for behavior in behaviors {
            behavior.applicationShouldRequestHealthAuthorization?(application)
        }
    }
}
