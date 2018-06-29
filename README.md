# AnalyticsManagerService

[![Twitter](https://img.shields.io/badge/Twitter-%40kuyazee-blue.svg)](http://twitter.com/kuyazee)
[![Github](https://img.shields.io/badge/Github-kuyazee-blue.svg)](https://github.com/kuyazee)
[![Cocoapods](https://img.shields.io/badge/Cocoapods-red.svg)](#installation)

A **Protocol Oriented Analytics Wrapper**. For more Information read my article on **[Medium](https://medium.com/@zonilyjame/a-protocol-oriented-analytics-layer-574e4967fe50)**

## Installation

To install the `AnalyticsManagerService` via [CocoaPods](http://cocoapods.org), simply use the add this in your podfile and then run `pod install`

```Cocoapods
pod 'AnalyticsManagerService'
```

## Usage

Simply create a subclass of `AnalyticsServiceProtocol` and `AnalyticsEventProtocol` for example we'll use **[Fabric](https://Fabric.io)** for the example

```Swift
// AnalyticsServiceProtocol
class FabricAnalyticsService: AnalyticsServiceProtocol {
    func initialize(application: UIApplication, launchOptions: [UIApplicationLaunchOptionsKey : Any]?) {
        Fabric.with([Answers.self])
    }
    
    func send(event: AnalyticsEventProtocol) {
        Answers.logCustomEvent(withName: event.name, customAttributes: event.parameters)
    }
}
```

```Swift
// AnalyticsEventProtocol
enum AnalyticsEvent: AnalyticsEventProtocol {
    case userLoggedIn
    case userLoggedOut
    case productSelected(productId: Int)

    var name: String { 
        switch self {
        case .userLoggedIn:     return "User Logged In"
        case .userLoggedOut:    return "User Logged Out"
        case .productSelected:  return "Product Selected"
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .userLoggedIn:                 return nil
        case .userLoggedOut:                return nil
        case .productSelected(id: let id):  return ["product_id": productId]
        }
    }

    var isTrackedOnAnalyticsServices: [AnalyticsServiceProtocol.Type] { 
        switch self {
        /// will be sent on 2 services 
        case .userLoggedIn:     return [FacebookAnalyticsService.self, FabricAnalyticsService.self]
            
        /// will not be sent anywhere
        case .userLoggedOut:    return [] 
            
        /// will be sent on only one service
        case .productSelected:  return [FacebookAnalyticsService.self]
        }
    }
}
```

Then we add the service in our `UIApplicationDelegate`

```Swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    ...
    
    // Add our services
    AnalyticsManagerService.shared.add(service: FacebookAnalyticsService())
    AnalyticsManagerService.shared.add(service: FabricAnalyticsService())

    // Initialize the analytics
    AnalyticsManagerService.shared.initialize(application: application: launchOptions: launchOptions)

    ...
}
```

Using an **event** would be as simple as accessing the singleton and using the `send(event: _)` function

```Swift
AnalyticsManagerService.shared.send(event: AnalyticsEvent.userLoggedIn)
AnalyticsManagerService.shared.send(event: AnalyticsEvent.productSelected(productId: productModel.id))
```
