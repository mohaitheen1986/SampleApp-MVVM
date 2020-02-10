//
//  UserDetailViewable.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import UIKit

protocol UserDetailViewable:AnyObject, Loadable {
    var viewModel: UserDetailViewModelable? { get set }
    var name: UILabel? { get set }
    var profileImage: UIImageView? { get set }
    var buttonCall: UIButton? { get set }
    var buttonEmail: UIButton? { get set }
    var address: UITextView? { get set }
}
