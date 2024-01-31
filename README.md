# AppBehaviorDispatcher

## Requirements 

- iOS 14 and above

## Usage Example

Import dependenices:

```swift
import AppBehaviorDispatcher
```

Use in AppDelegate:

```swift

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
```

Use in some Behavior file:

```swift
import UIKit
import AppBehaviorDispatcher

final class RootBehavior: NSObject, ApplicationBehavior {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Run some code here
        return true
    }
}
```

## Installation

### Swift Package Manager
1. Right click in the Project Navigator
2. Select "Add Packages..."
3. Search for ```https://github.com/eugene-software/AppBehaviorDispatcher.git```

## Author

Eugene Software

## License

AppBehaviorDispatcher is available under the MIT license. See the LICENSE file for more info.
