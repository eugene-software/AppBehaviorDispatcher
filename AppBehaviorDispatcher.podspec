#
# Be sure to run `pod lib lint AppBehaviorDispatcher.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AppBehaviorDispatcher'
  s.version          = '1.0.3'
  s.summary          = 'Convenient dispatcher for UIApplicationDelegate and app lifecycle'
  s.swift_version    = '5.0'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Import dependenices:

import AppBehaviorDispatcher
Use in AppDelegate:

import UIKit
import AppBehaviorDispatcher

class AppDelegate: AppBehaviorDelegate {

    var window: UIWindow?

    override var behaviors: [ApplicationBehavior] {

        return [
            RootBehavior()
        ]
    }
}
Use in some Behavior file:

import UIKit
import AppBehaviorDispatcher

final class RootBehavior: NSObject, ApplicationBehavior {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Run some code here
        return true
    }
}'

  s.homepage         = 'https://github.com/eugene-software/AppBehaviorDispatcher'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Eugene Software' => 'yevheniy.zaychenko@gmail.com' }
  s.source           = { :git => 'https://github.com/eugene-software/AppBehaviorDispatcher.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.ios.deployment_target = '13.0'

  s.source_files = 'Sources/AppBehaviorDispatcher/**/*'

  # s.resource_bundles = {
  #   'EZADatabase' => ['EZADatabase/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Foundation', 'UIKit'
end
