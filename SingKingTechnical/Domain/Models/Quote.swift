//
//  Quote.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/20/1401 AP.
//

import Foundation
struct Quote: Identifiable ,Codable {
    var id: Int
    var quote, author: String
    var series: String

}
