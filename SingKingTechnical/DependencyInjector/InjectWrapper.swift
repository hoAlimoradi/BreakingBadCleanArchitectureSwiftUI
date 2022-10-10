//
//  InjectWrapper.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi.
//
import Foundation

/// property wrapper to automatically inject dependencies through initialiser
/// ```
/// @Inject myDependency: DependencyProtocol
/// ```
@propertyWrapper
struct Inject<T> {
  private(set) var wrappedValue: T
  
  init() {
    // resolve the interface to an implementation
    self.wrappedValue = Resolver.shared.resolve(T.self)
  }
  
  mutating func mockWrappedValue(with wrappedValue: T) {
    self.wrappedValue = wrappedValue
  }
}
