//
//  UserListViewModelable.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import RxCocoa

protocol UserListViewModelable {

    init(view: UserListViewable?)
    var results: BehaviorRelay<UserListEntity?> { get set }
    var numberOfUsers: BehaviorRelay<Int?> { get }
    func viewModelForUser(at index: Int) -> UserViewModel?
}
