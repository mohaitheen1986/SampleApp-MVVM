//
//  UserListProvider.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import UIKit

class UserListProvider: UserListProvidable {
    var provider: Providable?
    
    func getUserLists(completion: @escaping (UserListEntity?) -> Void) {
        provider?.get(UserListEntity.self) { results in
            guard let results = results else {
                completion(nil)
                return
            }
            
            completion(results)
        }
    }
}
