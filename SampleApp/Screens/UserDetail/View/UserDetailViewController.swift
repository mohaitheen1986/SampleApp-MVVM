//
//  UserDetailViewController.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import UIKit
import Kingfisher

class UserDetailViewController: UIViewController, UserDetailViewable {
    var viewModel: UserDetailViewModelable?
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var profileImage: UIImageView?
    @IBOutlet weak var buttonCall: UIButton?
    @IBOutlet weak var buttonEmail: UIButton?
    @IBOutlet weak var address: UITextView?

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonCall!.addTarget(self, action: #selector(actionCall(_:)), for: .touchUpInside)
        buttonEmail!.addTarget(self, action: #selector(actionEmail(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
  
    @objc func actionCall(_ sender: UIButton) {
        callToPhone(phone: viewModel?.getPhone())
    }
    
    @objc func actionEmail(_ sender: UIButton) {
        sendEmail(recipients: [(viewModel?.getEmail())!], subject: "", body: "", images: nil)
    }

}
