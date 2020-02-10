//
//  UserListProvidable.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import UIKit

protocol UserListProvidable {
    var provider: Providable? { get set }
    func getUserLists(completion: @escaping (UserListEntity?) -> Void)
}
