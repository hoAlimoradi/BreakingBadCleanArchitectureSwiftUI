//
//  DeathsResultsDTO.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/20/1401 AP.
//

import Foundation
// MARK: - DeathsResultsDTOElement
struct DeathsDTO: Codable {
    let deathID: Int
    let death, cause, responsible, lastWords: String
    let season, episode, numberOfDeaths: Int

    enum CodingKeys: String, CodingKey {
        case deathID = "death_id"
        case death, cause, responsible
        case lastWords = "last_words"
        case season, episode
        case numberOfDeaths = "number_of_deaths"
    }
}

typealias DeathsResultsDTO = [DeathsDTO]
// MARK: - Mappers
extension DeathsDTO {
 
 /// Maps the Character DTO into a Character Model for UI use
 func toDeath() -> Death {
     return Death(id: self.deathID,
                  death: self.death,
                  cause: self.cause,
                  responsible: self.responsible,
                  lastWords: self.lastWords,
                  season: self.season,
                  episode: self.episode,
                  numberOfDeaths: self.numberOfDeaths)
  }
}
