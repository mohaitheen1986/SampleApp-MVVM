//
//  UserListViewModel.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import UIKit
import RxCocoa

class UserListViewModel: UserListViewModelable {
   
 
    var view: UserListViewable?
    var provider: UserListProvidable?
    var results = BehaviorRelay<UserListEntity?>(value: nil)
    var numberOfUsers = BehaviorRelay<Int?>(value: 0)

    
    required init(view: UserListViewable?) {
        self.view = view
        Rx.bind(view, selector: #selector(UIViewController.viewDidLoad), handler: load)
        Rx.bind(view, selector: #selector(UIViewController.viewDidLoad), handler: bindOutlets)
    }
    
    func bindOutlets() {
   
    }
    
    func viewModelForUser(at index: Int) -> UserViewModel? {
        guard index < numberOfUsers.value! else {
            return nil
        }
        return UserViewModel(user: (results.value?.results![index])!)
    }
   

  
    
    func load() {
        // Show the loading
        view?.showLoading()
        
        // Gets the user lists
        provider?.getUserLists(completion: { [weak self] (results) in
            // Hides the loading in case of success or failure
            defer {
                self!.view?.hideLoading()
            }
            
            // Check if the provider returned the data
            guard results != nil else {
                return
            }
            
            self?.results.accept(results)
            self!.numberOfUsers.accept(results?.results?.count)
            self?.view?.tableView?.reloadData()
            print(results as Any)
            
        })
        

        
    }
    
    

}
