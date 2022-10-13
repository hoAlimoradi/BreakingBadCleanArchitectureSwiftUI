//
//  HomeViewModel.swift
//  SingKingTechnical
//
//

import Foundation

final class SharedViewModel: ObservableObject {
    
  @Published private(set) var state = HomeState.idle
    
  @Published private(set) var characters = [Character]()
   
  @Published var selectedCharacterType: CharacterType = .all
    
  @Published private(set) var sortDescriptor: SortDescriptor = .default
   
  @Published private(set) var error: NetworkError?
   
  @Inject private var repository: CharactersRepository
    
  // pagination properties
  private var page = 1
  private var totalPages: Int?
  
  init() {
    Task {
        await getAllCharacters()
    }
  }
  
  
  @MainActor
  func getAllCharacters() async {
    reset()
    
    state = .loading
    
    defer {
      state = .fetching
    }
    
    do {
       let response = try await repository.getAllCharacters()
      print("response: \(response)")
      characters = response.compactMap { dto in
          dto.toCharacter()
      }
        print("characters.count: \(characters.count)")
        if(characters.isEmpty) {
              state = .empty
        } else {
            state = .idle
        }
        
    } catch {
        state = .error
      if let error = error as? NetworkError {
        self.error = error
      }
      else {
        self.error = .internalServerError
      }
    }
  }
}

private extension SharedViewModel {
  func reset() {
      characters.removeAll()
      state = .idle
  }
    
}

// MARK: - Convenience Init for testing
extension SharedViewModel {
  convenience init(repository: CharactersRepository) {
    self.init()
    self._repository.mockWrappedValue(with: repository)
  }
}
 
extension SharedViewModel {
    enum HomeState {
        case idle
        case fetching
        case loading
        case empty
        case error 
    }
}

 
