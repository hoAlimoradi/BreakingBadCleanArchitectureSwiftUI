//
//  QuoteRepositoryImple.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/20/1401 AP.
//

import Foundation

final class QuoteRepositoryImple: QuoteRepository {
     
    @Inject private var service: Networking
    
    func getAllQuotes() async throws -> QuoteResultsDTO {
        let response = try await service.request(
            .quote,
          type: QuoteResultsDTO.self
        )
        print("response: \(response)")
        return response
    }
  
}
 
 
extension QuoteRepositoryImple {
  convenience init(service: Networking) {
    self.init()
    self._service.mockWrappedValue(with: service)
  }
}
