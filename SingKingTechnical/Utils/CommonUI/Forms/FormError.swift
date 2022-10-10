//
//  FormError.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi .
//

import Foundation

enum FormError: Error, LocalizedError {
  case networking(error: LocalizedError)
  case validation(error: LocalizedError)
  case system(error: Error)
  
  var errorDescription: String? {
    switch self {
    case .networking(let error),
        .validation(let error):
      return error.errorDescription
    case .system(let error):
      return error.localizedDescription
    }
  }
}
