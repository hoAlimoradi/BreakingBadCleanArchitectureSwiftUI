//
//  Character.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/18/1401 AP.
//

import SwiftUI
struct Character: Identifiable ,Codable {
    var id: Int 
    var name: String
    var birthday: String
    var occupation: [String]
    var imageURL: String
    var status: String
    var nickName: String
    var appearance: [Int]
    var portrayed: String
    var category: String
    var betterCallSaulAppearance: [Int]
    var isLiked: Bool
    
    
    public var characterBG: Color {
      
      let colors: [Color] = [.theme.paleBlue, .theme.paleGreen, .theme.palePink, .theme.paleYellow]
      
      return colors.randomElement() ?? .theme.palePink
    }
}
enum SortDescriptor: String {
  case priceDescending = "priceDesc"
  case priceAscending = "priceAsc"
  case `default` // default case is the
}
// MARK: - CharacterType Enum
enum CharacterType: String, CaseIterable {
  case all = "All"
  case id = "id"
  case name = "name"
  case birthday = "birthday"
  case occupation = "occupation"
  case nickname = "nickname"
  case other = "Other"
  
  var image: Image {
    switch self {
    case .all:
      return .all
    case .id:
      return Image.person1
    case .name:
      return Image.person2
    case .birthday:
      return Image.person3
    case .occupation:
      return Image.person4
    case .nickname:
      return Image.person5
    case .other:
      return Image.person6
    }
  }
  
  var identifier: String? {
    switch self {
    case .all:
      return nil
    case .id:
      return "4"
    case .name:
      return "3"
    case .birthday:
      return "2"
    case .occupation:
      return "1"
    case .nickname:
      return "5"
    case .other:
      return "6"
    }
  }
}
