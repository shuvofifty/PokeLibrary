//
//  PokemonTypeDataController.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/12/22.
//

import Foundation
import Combine

protocol PokemonTypeDataController {
    func getCategoryDetail(for id: Int) -> AnyPublisher<PokemonTypeDetailResponse, APIError>
}

class PokemonTypeDataControllerImp: PokemonTypeDataController {
    private let apiPath: CategoryAPIPath
    private let networking: Networking
    
    init(apiPath: CategoryAPIPath, networking: Networking) {
        self.apiPath = apiPath
        self.networking = networking
    }
    
    func getCategoryDetail(for id: Int) -> AnyPublisher<PokemonTypeDetailResponse, APIError> {
        networking.send(request: Request(type: .GET, url: apiPath.getURL(for: "\(apiPath.pokemonType)/\(id)"), header: [:], body: [:]))
            .receive(on: DispatchQueue.main)
            .tryMap { data -> PokemonTypeDetailResponse in
                guard let object = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    throw APIError.fileConversionError(code: 100, type: .JSON, message: "Unable to convert to JSON")
                }
                return PokemonTypeDetailResponse(rawJson: object)
            }
            .mapError { $0 as? APIError ?? .unknownError("unknown Error occured at getCategoryDetail()")}
            .eraseToAnyPublisher()
    }
}
