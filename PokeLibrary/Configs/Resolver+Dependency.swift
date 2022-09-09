//
//  Resolver+Dependency.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/9/22.
//

import Foundation
import Factory

extension Container {
    static let pokemonDataController = Factory<PokemonDataController> { PokemonDataControllerImp(apiPath: Container.homeApiPaths(), networking: Container.networking()) }
    static let homeApiPaths = Factory<HomeAPIPaths> { APIProdPathImp() }
    static let networking = Factory<Networking> { NetworkingImp() }
}
