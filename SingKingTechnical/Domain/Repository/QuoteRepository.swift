//
//  QuoteRepository.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/20/1401 AP.
//

import Foundation
protocol QuoteRepository {
    func getAllQuotes() async throws -> QuoteResultsDTO
}
