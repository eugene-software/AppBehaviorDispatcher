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

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        for behavior in behaviors {
            behavior.scene?(scene, willConnectTo: session, options: connectionOptions)
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        for behavior in behaviors {
            behavior.sceneDidDisconnect?(scene)
        }
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        for behavior in behaviors {
            behavior.sceneDidBecomeActive?(scene)
        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        for behavior in behaviors {
            behavior.sceneWillResignActive?(scene)
        }
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        for behavior in behaviors {
            behavior.sceneWillEnterForeground?(scene)
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        for behavior in behaviors {
            behavior.sceneDidEnterBackground?(scene)
        }
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        for behavior in behaviors {
            behavior.scene?(scene, openURLContexts: URLContexts)
        }
    }

    func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
        let activity = behaviors.compactMap { $0.stateRestorationActivity?(for: scene) }.first
        return activity
    }

    func scene(_ scene: UIScene, restoreInteractionStateWith stateRestorationActivity: NSUserActivity) {
        for behavior in behaviors {
            behavior.scene?(scene, restoreInteractionStateWith: stateRestorationActivity)
        }
    }

    func scene(_ scene: UIScene, willContinueUserActivityWithType userActivityType: String) {
        for behavior in behaviors {
            behavior.scene?(scene, willContinueUserActivityWithType: userActivityType)
        }
    }

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        for behavior in behaviors {
            behavior.scene?(scene, continue: userActivity)
        }
    }

    func scene(_ scene: UIScene, didFailToContinueUserActivityWithType userActivityType: String, error: any Error) {
        for behavior in behaviors {
            behavior.scene?(scene, didFailToContinueUserActivityWithType: userActivityType, error: error)
        }
    }

    func scene(_ scene: UIScene, didUpdate userActivity: NSUserActivity) {
        for behavior in behaviors {
            behavior.scene?(scene, didUpdate: userActivity)
        }
    }
}
