//
//  DeathsRepositoryImple.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/20/1401 AP.
//

import Foundation

final class DeathsRepositoryImple: DeathsRepository {
     
    @Inject private var service: Networking
    
    func getAllDeaths() async throws -> DeathsResultsDTO {
        let response = try await service.request(
          .death,
          type: DeathsResultsDTO.self
        )
        print("response: \(response)")
        return response
    }
  
}
 
// MARK: - Convenience Init for testing
extension DeathsRepositoryImple {
  convenience init(service: Networking) {
    self.init()
    self._service.mockWrappedValue(with: service)
  }
}
