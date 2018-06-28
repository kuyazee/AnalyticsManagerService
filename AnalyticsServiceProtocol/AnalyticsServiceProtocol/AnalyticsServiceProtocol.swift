//
//  AnalyticsServiceProtocol.swift
//  AnalyticsServiceProtocol
//
//  Created by Zonily Jame Pesquera on 28/06/2018.
//  Copyright © 2018 Zonily Jame Pesquera. All rights reserved.
//

import Foundation

public protocol AnalyticsServiceProtocol {
    
    /// This will be called within AppDelegate application:didFinishLaunchingWithOptions: method
    /// In this method, you should initialize the SDK.
    func initialize(application: UIApplication, launchOptions: [UIApplicationLaunchOptionsKey: Any]?)
    
    /// This will actually track events in the app.
    func send(event: AnalyticsEventProtocol)
    
    /// This checks whether an event is being tracked in
    /// the type that implements this protocol
    func shouldTrack(event: AnalyticsEventProtocol) -> Bool
}

public extension AnalyticsServiceProtocol {
    
    /// Default implementation.
    func shouldTrack(event: AnalyticsEventProtocol) -> Bool {
        return event.isTrackedOnAnalyticsServices.contains(where: { $0 is Self.Type })
    }
}
