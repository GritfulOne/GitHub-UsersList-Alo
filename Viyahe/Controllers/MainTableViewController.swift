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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
