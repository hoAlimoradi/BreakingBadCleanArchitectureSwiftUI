//
//  CharacterResultsDTO.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi 
//

import Foundation

typealias CharacterResultsDTO = [CharacterDTO]
// MARK: - CharacterDTO
struct CharacterDTO: Codable {
    let charID: Int
    let name: String
    let birthday: String
    let occupation: [String]
    let img: String
    let status: String
    let nickname: String
    let appearance: [Int]
    let portrayed: String
    let category: String
    let betterCallSaulAppearance: [Int]

    enum CodingKeys: String, CodingKey {
        case charID = "char_id"
        case name, birthday, occupation, img, status, nickname, appearance, portrayed, category
        case betterCallSaulAppearance = "better_call_saul_appearance"
    }
}
 
// MARK: - Mappers
extension CharacterDTO {
  
  /// Maps the Character DTO into a Character Model for UI use
  func toCharacter() -> Character {
      return Character(id: self.charID,
                       name: self.name,
                       birthday: self.birthday,
                       occupation: self.occupation,
                       imageURL: self.img,
                       status: self.status,
                       nickName: self.nickname,
                       appearance: self.appearance,
                       portrayed: self.portrayed,
                       category: self.category,
                       betterCallSaulAppearance: self.betterCallSaulAppearance,
                       isLiked: false)
  }
}
