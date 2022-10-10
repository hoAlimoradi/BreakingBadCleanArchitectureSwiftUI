//
//  BaseViewModel.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi.
//

import SwiftUI

/// Represents the high level view state of the app
final class BaseViewModel: ObservableObject {
  
  // Tab bar
  @Published var currentTab: Tab = .home
  
  // basket sheet
  //@Published var showBasket = false
  
  // Side bar
  @Published var showSideBar = false
  
  // Detail View properties
  @Published private(set) var currentCharacter: Character?
  @Published var showDetail = false
  
  public func dismissDetailView() {
      currentCharacter = nil
      showDetail = false
  }
  
  public func navigate(to character: Character) {
    currentCharacter = character
    showDetail = true
  }
}

// tab items
enum Tab: String {
  case home = "house"
  case heart = "heart.fill"
  case clipboard = "rectangle.grid.3x2.fill"
  case profile = "person.fill"
}
