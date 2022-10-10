//
//  NetworkMonitor.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi.
//

import Foundation
import Network

final class NetworkMonitor: ObservableObject {
  
  @Published var connected = false
  
  var connectionDescription: String {
    return connected ? "You're back online!" : "It looks like you don't have internet connection"
  }
  
  var symbolName: String {
    return connected ? "wifi" : "wifi.slash"
  }
  
  private let monitor = NWPathMonitor()
  private let queue = DispatchQueue(label: "NetworkManager", qos: .utility)
  
  init() {
    monitor.pathUpdateHandler = { [weak self] path in
      DispatchQueue.main.async {
        self?.connected = path.status == .satisfied
      }
    }
  
    monitor.start(queue: queue)
  }
  
}

