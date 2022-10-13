//
//  AllEndPointsViewModel.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/20/1401 AP.
//

import Foundation
import Combine

final class AllEndPointsViewModel: ObservableObject {
    
    @Published var state = State.loading
    
    @Published private(set) var episodes = [Episode]()
    
    @Published private(set) var deaths = [Death]()
    
    @Published private(set) var quotes = [Quote]()
    
    @Published private(set) var error: NetworkError?
     
    var bag: Set<AnyCancellable> = .init()
    
    @Inject private var episodesRepository: EpisodesRepository
    
    @Inject private var deathsRepository: DeathsRepository
    
    @Inject private var quoteRepository: QuoteRepository
    
    init() {
        Task {
            print("await getAllEpisodes")
            
            await getAllDeaths()
            await getAllQuotes()
            await getAllEpisodes()
        }
    }
    func setUpBindings() {
        Publishers.CombineLatest3($episodes, $deaths, $quotes)
            .sink { _ in
                self.state = .idle
            }
            .store(in: &bag)
    }
    
    @MainActor
    func getAllEpisodes() async {
        print("getAllEpisodes")
        //reset()
        state = .loading
        
        defer {
            state = .fetching
        }
        
        do {
            let response = try await episodesRepository.getAllEpisodes()
            print("episodes response: \(response)")
            episodes = response.compactMap { dto in
                dto.toEpisode()
            }
            print("episodes count: \(episodes.count)")
            if(episodes.isEmpty) {
                state = .empty
            } else {
                state = .idle
            }
            
        } catch {
            print("episodes  : \(error.localizedDescription)")
            state = .error
            if let error = error as? NetworkError {
                self.error = error
            }
            else {
                self.error = .internalServerError
            }
        }
    }
    
    @MainActor
    func getAllDeaths() async {
        print("getAllDeaths")
        
        do {
            let response = try await deathsRepository.getAllDeaths()
            print("getAllDeaths response: \(response)")
            deaths  = response.compactMap { dto in
                dto.toDeath()
            }
            print("getAllDeaths count: \(episodes.count)")
        } catch {
            print("getAllDeaths  : \(error.localizedDescription)")
        }
    }
    
    
    @MainActor
    func getAllQuotes() async {
        print("getAllQuotes")
        
        do {
            let response = try await quoteRepository.getAllQuotes()
            print("quotes response: \(response)")
            quotes = response.compactMap { dto in
                dto.toQuote()
            }
            
            
        } catch {
            print("quotes  : \(error.localizedDescription)")
        }
    }
    
}

private extension AllEndPointsViewModel {
    func reset() {
        episodes.removeAll()
        state = .idle
    }
    
}

// MARK: - Convenience Init for testing
extension AllEndPointsViewModel {
    convenience init(episodesRepository: EpisodesRepository,
                     deathsRepository: DeathsRepository,
                     quoteRepository: QuoteRepository) {
        self.init()
        self._episodesRepository.mockWrappedValue(with: episodesRepository)
        self._deathsRepository.mockWrappedValue(with: deathsRepository)
        self._quoteRepository.mockWrappedValue(with: quoteRepository)
    }
}

extension AllEndPointsViewModel {
    enum State {
        case idle
        case fetching
        case loading
        case empty
        case error
    }
}


