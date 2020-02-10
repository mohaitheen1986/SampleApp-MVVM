//
//  UserListsViewController.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import UIKit

class UserListsViewController: UIViewController, UserListViewable, Loadable, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView?

    var viewModel: UserListViewModelable?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "User Lists"
        
//        tableView?.register(UINib(nibName: "UserListCell", bundle: nil), forCellReuseIdentifier: "UserListCell")
        tableView?.rowHeight = 90
        // Do any additional setup after loading the view.
    }
    
}

extension UserListsViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.numberOfUsers.value)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "UserListCell",
            for: indexPath) as! UserListCell
        
        cell.configure(viewModel: (viewModel?.viewModelForUser(at: indexPath.row))!)
        cell.delegate = self
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
//        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserDetailViewController") as? UserDetailViewController

        
        SwinInjector.defaultContainer.register(UserDetailViewModelable.self) { resolver in
            let viewModel = UserDetailViewModel(view: resolver.resolve(UserDetailViewable.self), model: (self.viewModel?.viewModelForUser(at: indexPath.row))!)
            return viewModel
        }
        let view:UserDetailViewController  = SwinInjector.defaultContainer.resolve(UserDetailViewable.self) as! UserDetailViewController
        
        
        self.navigationController?.pushViewController(view, animated: true)



       
//        SwinInjector.defaultContainer.resolve(UserDetailViewModel(view: resolver.resolve(UserDetailViewable.self), model: nil))
        
//        performSegue(withIdentifier: "UserDetailViewController", sender: self)
    }
    
}

extension UserListsViewController: CellActionsDelegate {
    
    func didTapCall(phone: String?) {
        callToPhone(phone: phone)
    }
    
    func didTapEmail(email: String?) {
        sendEmail(recipients: [email!], subject: "", body: "", images: nil)
    }
}
