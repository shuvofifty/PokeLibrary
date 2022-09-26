//
//  Cordinator.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/9/22.
//

import Foundation
import SwiftUI
import Factory

protocol RootCordinator {
    var homeCordinator: HomeCordinator! { get }
    var categoryCordinator: CategoryCordinator! { get }
    var viewFactory: ViewFactory! { get }
}

class RootCordinatorImp: RootCordinator {
    lazy var homeCordinator: HomeCordinator! = {
        HomeCordinatorImp(rootCordinator: self)
    }()
    
    lazy var categoryCordinator: CategoryCordinator! = {
        CategoryCordinatorImp(rootCordinator: self)
    }()
    
    lazy var viewFactory: ViewFactory! = {
        ViewFactory()
    }()
    
    init() {}
}

protocol HomeCordinator: Cordinator {
    var rootCordinator: RootCordinator { get }
    
    func createPokemonDetailViewController(pokemonId: Int) -> PokemonDetailViewController
}

class HomeCordinatorImp: HomeCordinator {
    let rootCordinator: RootCordinator
    var router: Router? = nil
    
    init(rootCordinator: RootCordinator) {
        self.rootCordinator = rootCordinator
    }
    
    func start() {
        // Empty
    }
    
    func getWithRoute() -> UINavigationController? {
        let nav = UINavigationController(rootViewController: createHomeViewController())
        router = RouterImp(navigationController: nav)
        
        return nav
    }
    
    private func createHomeViewController() -> HomeViewController {
        let viewModel = HomeView.ViewModel(pokemonDataController: Container.pokemonDataController(), cordinator: self)
        return HomeViewController(viewModel: viewModel)
    }
    
    func createPokemonDetailViewController(pokemonId: Int) -> PokemonDetailViewController {
        let viewModel = PokemonDetailView.ViewModel(
            pokemonId: pokemonId,
            pokemonDataController: Container.pokemonDataController()
        )
        return PokemonDetailViewController(viewModel: viewModel)
    }
}

protocol CategoryCordinator: Cordinator {
    var rootCordinator: RootCordinator { get }
}

class CategoryCordinatorImp: CategoryCordinator {
    let rootCordinator: RootCordinator
    var router: Router?
    
    init(rootCordinator: RootCordinator) {
        self.rootCordinator = rootCordinator
    }
    
    func start() {
        // Empty
    }
    
    func getWithRoute() -> UINavigationController? {
        let nav = UINavigationController(rootViewController: createCategoryViewController())
        router = RouterImp(navigationController: nav)
        return nav
    }
    
    private func createCategoryViewController() -> CategoryViewController {
        let viewModel = CategoryView.ViewModel(pokemonDataController: Container.pokemonDataController(), pokemonTypeDataController: Container.pokemonTypeDataController())
        return CategoryViewController(viewModel: viewModel, cordinator: self)
    }
}

protocol Cordinator {
    var router: Router? { get }
    
    func start()
    func getWithRoute() -> UINavigationController?
}

// All SwiftUI View will build here with some quick functions. All params need to be standalone function
class ViewFactory {
    func createCategoryCellView(typeId: Int, category: PokemonType) -> some View {
        return CategoryBoxCellView(typeId: typeId, type: category)
    }
}
