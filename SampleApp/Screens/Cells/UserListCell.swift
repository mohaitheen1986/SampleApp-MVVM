//
//  UserListCell.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import UIKit
import Kingfisher

class UserListCell: UITableViewCell {
    
    @IBOutlet weak var bgContainer: CardView?
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var profileImage: UIImageView?
    @IBOutlet weak var buttonCall: UIButton?
    @IBOutlet weak var buttonEmail: UIButton?
    
    var delegate: CellActionsDelegate?

    var email: String?
    var phone: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        buttonCall!.addTarget(self, action: #selector(actionCall(_:)), for: .touchUpInside)
        buttonEmail!.addTarget(self, action: #selector(actionEmail(_:)), for: .touchUpInside)

    }

    func configure(viewModel: UserViewModel) {
        name?.text = viewModel.name
        email = viewModel.email
        phone = viewModel.phone
        
        let processor = RoundCornerImageProcessor(cornerRadius: 25)
        profileImage?.kf.setImage(with: URL(string: viewModel.profielImageUrl), placeholder: nil, options: [.processor(processor)])
    }
    
    @objc func actionCall(_ sender: UIButton) {
        self.delegate?.didTapCall(phone: phone)
    }
    
    @objc func actionEmail(_ sender: UIButton) {
        self.delegate?.didTapEmail(email: email)
    }
   
}
