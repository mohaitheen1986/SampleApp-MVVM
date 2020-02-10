//
//  UserListViewable.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//


import UIKit

protocol UserListViewable: AnyObject, Loadable {
    var viewModel: UserListViewModelable? { get set }
    var tableView: UITableView? { get set }
}
