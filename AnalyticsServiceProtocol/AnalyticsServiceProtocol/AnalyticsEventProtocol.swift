//
//  AnalyticsEventProtocol.swift
//  AnalyticsServiceProtocol
//
//  Created by Zonily Jame Pesquera on 28/06/2018.
//  Copyright © 2018 Zonily Jame Pesquera. All rights reserved.
//

import Foundation

public protocol AnalyticsEventProtocol {
    /// This holds the name of the event
    var name: String { get }
    
    /// This holds the parameters if any of the event
    var parameters: [String: Any]? { get }
    
    /// This determins if an event is to be sent in a
    /// AnalyticsServiceProtocol conforming type.
    var isTrackedOnAnalyticsServices: [AnalyticsServiceProtocol.Type] { get }
}
