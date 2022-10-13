//
//  Death.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/20/1401 AP.
//

import Foundation
struct Death: Identifiable ,Codable {
    var id: Int
    var death, cause, responsible, lastWords: String
    var season, episode, numberOfDeaths: Int
}
