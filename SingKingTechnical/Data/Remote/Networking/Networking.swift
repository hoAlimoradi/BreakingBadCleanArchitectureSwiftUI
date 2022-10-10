//
//  Networking.swift
//  SingKingTechnical
// 
//
import Foundation

protocol Networking {
  func request<T: Codable>(_ endpoint: Endpoint, type: T.Type) async throws -> T
  func request(_ endpoint: Endpoint) async throws
}
