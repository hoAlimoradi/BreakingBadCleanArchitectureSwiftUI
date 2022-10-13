//
//  EpisodesRepositoryImple.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/19/1401 AP.
//
 
import Foundation
final class EpisodesRepositoryImple: EpisodesRepository {
     
    @Inject private var service: Networking
    
    func getAllEpisodes() async throws -> EpisodeResultsDTO {
        print("getAllEpisodesresponse:  async throws ")
        
        let response = try await service.request(
          .episodes,
          type: EpisodeResultsDTO.self
        )
        
        print("getAllEpisodesresponse: \(response)")
        
        return response
    }
  
}
 
// MARK: - Convenience Init for testing
extension EpisodesRepositoryImple {
  convenience init(service: Networking) {
    self.init()
    self._service.mockWrappedValue(with: service)
  }
}
