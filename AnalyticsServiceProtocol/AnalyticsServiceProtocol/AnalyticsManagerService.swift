//
//  AnalyticsManagerService.swift
//  AnalyticsServiceProtocol
//
//  Created by Zonily Jame Pesquera on 28/06/2018.
//  Copyright © 2018 Zonily Jame Pesquera. All rights reserved.
//

import UIKit

final public class AnalyticsManagerService: AnalyticsServiceProtocol {
    
    /// A strong referenced array of services added
    internal private(set) var services: [AnalyticsServiceProtocol]  = []
    
    /// A singleton
    public static let shared: AnalyticsManagerService = AnalyticsManagerService()
    
    /// This is set to private so this class cannot be
    /// reinstantiated anywhere else.
    private init() {}
    
    /// Use this function to add another AnalyticsServiceProtocol
    /// conforming type
    public func add(service: AnalyticsServiceProtocol) {
        self.services.append(service)
    }
    
    // MARK: - AnalyticsServiceProtocol
    
    public func initialize(application: UIApplication, launchOptions: [UIApplicationLaunchOptionsKey : Any]?) {
        self.services.forEach { $0.initialize(application: application, launchOptions: launchOptions) }
    }
    
    public func send(event: AnalyticsEventProtocol) {
        for service in self.services where service.shouldTrack(event: event) {
            service.send(event: event)
        }
    }
}
