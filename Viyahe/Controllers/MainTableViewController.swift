//
//  MainTableViewController.swift
//  Viyahe
//
//  Created by Gino Simon Alo on 5/4/21.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private enum Constants {
      static let cellIdentifier = "Cell"
    }
    
    var viewModel: MainTableViewViewModel!
    
    let colorSelector = ColorSelector()
    
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "GITHUB USERS"
        
        tableView.separatorColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)

        viewModel.getUsers() { [weak self] (success, users) in
            if success {
                self?.users = users ?? [User]()
                self?.tableView.reloadData()
            } else {
                self?.viewModel.showErrorAlert()
            }
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? UserTableViewCell else {
            fatalError("Unknown cell")
        }
        
        
        cell.setup(withUser: users[indexPath.row], avatarBorderColor: colorSelector.getColor(forInt: indexPath.row))

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showProfilePage(forUser: users[indexPath.row])
    }

}
