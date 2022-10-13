//
//  QuoteResultsDTO.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/20/1401 AP.
//

import Foundation
// MARK: - QuoteResultsDTOElement
struct QuoteDTO: Codable {
    let quoteID: Int
    let quote, author: String
    let series: String

    enum CodingKeys: String, CodingKey {
        case quoteID = "quote_id"
        case quote, author, series
    }
}
 
typealias QuoteResultsDTO = [QuoteDTO]
// MARK: - Mappers
extension QuoteDTO {
 
 /// Maps the Character DTO into a Character Model for UI use
 func toQuote() -> Quote {
     return Quote(id: self.quoteID,
                  quote: self.quote,
                  author: self.author,
                  series: self.series)
  }
}
