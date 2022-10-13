//
//  EpisodesRepository.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/19/1401 AP.
//

import Foundation
protocol EpisodesRepository {
    func getAllEpisodes() async throws -> EpisodeResultsDTO
}
