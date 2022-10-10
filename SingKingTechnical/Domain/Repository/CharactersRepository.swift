//
//  CharactersRepository.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi 
//

import Foundation

protocol CharactersRepository {
    func getAllCharacters() async throws -> CharacterResultsDTO
}
