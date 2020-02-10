//
//  UserViewModel.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import UIKit

struct UserViewModel {
    private var user: UserItem
    
    init(user: UserItem) {
        self.user = user
    }
    
    var name: String {
        return (user.name?.first)! + " " + (user.name?.last)!
    }
    
    var email: String {
        return user.email!
    }
    
    var phone: String {
        return user.phone!
    }
    
    var profielImageUrl: String {
        return (user.picture?.medium)!
    }
    
    var profielLargeImageUrl: String {
        return (user.picture?.large)!
    }
    
    var address: String {
        return "\(user.location!.street!.number),  \(user.location!.street!.name!), \(user.location!.city!), \(user.location!.state!), \(user.location!.country!)"
    }
    
}
