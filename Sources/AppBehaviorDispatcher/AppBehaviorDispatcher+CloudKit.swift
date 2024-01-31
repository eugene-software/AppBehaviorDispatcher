//
//  AppBehaviorDispatcher+AppExtension.swift
//
//  Created by Eugeniy Zaychenko on 11/8/18.
//  Copyright © 2024 Eugeniy Zaychenko. All rights reserved.
//
//  Adapted from: https://github.com/onmyway133/LighterAppDelegate

import UIKit
import CloudKit

extension AppBehaviorDispatcher {

    @available(iOS 10.0, *)
    func application(_ application: UIApplication, userDidAcceptCloudKitShareWith cloudKitShareMetadata: CKShare.Metadata) {
        
        for behavior in behaviors {
            behavior.application?(application, userDidAcceptCloudKitShareWith: cloudKitShareMetadata)
        }
    }
}
