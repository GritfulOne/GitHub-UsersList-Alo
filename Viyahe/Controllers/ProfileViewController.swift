//
//  ProfileViewController.swift
//  Viyahe
//
//  Created by Gino Simon Alo on 5/5/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var viewModel: ProfileViewCotrollerViewModel!
    private lazy var profilePageContent: ProfilePageContent = {
        return ProfilePageContent()
    }()
    
    var user: User? {
        didSet {
            guard  let user = user else {
                return
            }
            
            viewModel.getFullDetails(forUser: user) { [weak self] user in
                self?.title = user.getFullName()
                self?.profilePageContent.user = user
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(profilePageContent)
        
        profilePageContent.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(topbarHeight + 16)
            make.leading.trailing.equalToSuperview()
        }
    }
}

extension UIViewController {

    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */

    var topbarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
