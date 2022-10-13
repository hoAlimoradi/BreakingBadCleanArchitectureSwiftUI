//
//  DeathsRepository.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/20/1401 AP.
//

import Foundation
protocol DeathsRepository {
    func getAllDeaths() async throws -> DeathsResultsDTO
}
