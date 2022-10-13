//
//  Endpoint.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi.
//

import Foundation

// MARK: - Endpoints
/// endpoints available for our application in the backend
enum Endpoint {
  case characters
  case episodes
  case death
  case quote
}

// MARK: - Host and Paths
extension Endpoint {
  var host: String {
    return "www.breakingbadapi.com"
  }
  
  var path: String {
    switch self {
    case .characters:
      return "/api/characters"
    case .episodes:
      return "/api/episodes"
    case .death:
      return "/api/deaths"
    case .quote:
      return "/api/quotes"
    } 
  }
}

// MARK: - MethodType and URL Building
extension Endpoint {
  
  enum MethodType: Equatable {
    case GET
    case POST(data: Data?)
    case DELETE
  }
  
  var methodType: MethodType {
    switch self {
    case .characters,
            .episodes,
            .death,
            .quote :
      return .GET
    }
  }
  
  var url: URL? {
    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = host
    urlComponents.path = path
    
    return urlComponents.url
  }
}

