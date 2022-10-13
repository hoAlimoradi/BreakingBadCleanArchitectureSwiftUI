//
//  Resolver.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi.
//

import Foundation
import Swinject

/// Utility Resolver class to resolve dependencies from the container
final class Resolver {
    static let shared = Resolver()
    
    private var container = buildContainer()
    
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
}

/// Builds the Swinject Dependency Container
fileprivate func buildContainer() -> Container {
    let container = Container()
    
    container.register(ImageService.self) { _ in
        return CloudinaryService()
    }
    .inObjectScope(.container)
    
    
    container.register(CharactersRepository.self) { _ in
        return CharactersRepositoryImple()
    }
    .inObjectScope(.container)
    
    
    container.register(QuoteRepository.self) { _ in
        return QuoteRepositoryImple()
    }
    .inObjectScope(.container)
     
    container.register(DeathsRepository.self) { _ in
        return DeathsRepositoryImple()
    }
    .inObjectScope(.container)
    
    
    container.register(EpisodesRepository.self) { _ in
        return EpisodesRepositoryImple()
    }
    .inObjectScope(.container)
    //
    container.register(Networking.self) { _ in
        return NetworkService(session: .shared)
    }
    .inObjectScope(.container)
    
    return container
}

