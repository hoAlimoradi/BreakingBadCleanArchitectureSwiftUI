//
//  EpisodeResultsDTO.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/19/1401 AP.
//

import Foundation

 

// MARK: - EpisodeResultsDTOElement

struct EpisodeDTO: Codable {
    let episodeID: Int
    let title: String
    let season, episode: String
    let airDate: String
    let characters: [String]

    enum CodingKeys: String, CodingKey {
        case episodeID = "episode_id"
        case title, season, episode
        case airDate = "air_date"
        case characters
    }
}

typealias EpisodeResultsDTO = [EpisodeDTO]

// MARK: - Mappers
extension EpisodeDTO {
 
 /// Maps the Character DTO into a Character Model for UI use
 func toEpisode() -> Episode {
     return Episode(id: self.episodeID,
                    title: self.title,
                    season: self.season,
                    episode: self.episode,
                    airDate: self.airDate,
                    characters: self.characters )
  }
}
