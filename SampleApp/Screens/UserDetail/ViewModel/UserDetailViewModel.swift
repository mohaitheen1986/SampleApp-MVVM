//
//  UserDetailViewModel.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import UIKit
import RxCocoa
import Kingfisher

class UserDetailViewModel: UserDetailViewModelable {
   
    var view: UserDetailViewable?
    var viewModel: UserViewModel?
    var name = BehaviorRelay<String?>(value: nil)
    var address = BehaviorRelay<String?>(value: nil)

    required init(view: UserDetailViewable?, model: UserViewModel?) {
        self.view = view
        self.viewModel = model
        Rx.bind(view, selector: #selector(UIViewController.viewDidLoad), handler: bindOutlets)
        Rx.bind(view, selector: #selector(UIViewController.viewDidLoad), handler: bindValues)

    }
    
    func bindOutlets() {

        Rx.bind(view?.name, property: name)
        Rx.bind(view?.address, property: address)
        
    }
    
    func bindValues() {
        
       name.accept(self.viewModel?.name)
       address.accept(self.viewModel?.address)
       let processor = RoundCornerImageProcessor(cornerRadius: 50)
        view?.profileImage?.kf.setImage(with: URL(string: self.viewModel!.profielLargeImageUrl), placeholder: nil, options: [.processor(processor)])
    }
    
    

}
