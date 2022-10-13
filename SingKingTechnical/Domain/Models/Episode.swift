//
//  Episode.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/19/1401 AP.
//

import SwiftUI
struct Episode: Identifiable ,Codable {
    var id: Int
    var title: String
    var season, episode: String
    var airDate: String
    var characters: [String]
    
    public var characterBG: Color {
      
      let colors: [Color] = [.theme.paleBlue, .theme.paleGreen, .theme.palePink, .theme.paleYellow]
      
      return colors.randomElement() ?? .theme.palePink
    }
}
