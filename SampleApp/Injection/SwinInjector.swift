//
//  SwiftInjector.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import Foundation
import Swinject

class SwinInjector {
    static var defaultContainer = Container()

    static func setup() {
        defaultContainer
            .register(UserListViewable.self) { resolver in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateInitialViewController() as? UserListsViewController
                return viewController ?? UserListsViewController()
            }
            .initCompleted { resolver, view in
                view.viewModel = resolver.resolve(UserListViewModelable.self)
        }
        
       
        defaultContainer
            .register(UserDetailViewable.self) { resolver in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "UserDetailViewController")  as? UserDetailViewController
                return viewController ?? UserDetailViewController()
            }
            .initCompleted { resolver, view in
                view.viewModel = resolver.resolve(UserDetailViewModelable.self)
        }
        
        defaultContainer.register(UserListViewModelable.self) { resolver in
            let viewModel = UserListViewModel(view: resolver.resolve(UserListViewable.self))
            viewModel.provider = resolver.resolve(UserListProvidable.self)
            return viewModel
        }
        
       
        
        defaultContainer.register(UserListProvidable.self) { resolver in
            let provider = UserListProvider()
            provider.provider = resolver.resolve(Providable.self)
            return provider
        }
        
        defaultContainer.register(Providable.self) { resolver in
            return NetworkProvider()
        }
        
    }
    
}


