//
//  Resolver+Dependency.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/9/22.
//

import Foundation
import Factory

extension Container {
    static let pokemonDataController = Factory<PokemonDataController> { PokemonDataControllerImp(apiPath: Container.apiPath(), networking: Container.networking()) }
    static let apiPath = Factory<APIProdPathImp>(scope: .singleton) { APIProdPathImp() }
    static let networking = Factory<Networking>(scope: .singleton) { NetworkingImp() }
}
