//
//  CharactersRepository.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/17/1401 AP.
//

 
import Foundation

final class CharactersRepositoryImple: CharactersRepository {
     
    @Inject private var service: Networking
    
    func getAllCharacters() async throws -> CharacterResultsDTO {
        let response = try await service.request(
          .characters,
          type: CharacterResultsDTO.self
        )
        print("response: \(response)")
        return response
    }
  
}
 
// MARK: - Convenience Init for testing
extension CharactersRepositoryImple {
  convenience init(service: Networking) {
    self.init()
    self._service.mockWrappedValue(with: service)
  }
}
