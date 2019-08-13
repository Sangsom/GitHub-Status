//
//  ViewController.swift
//  GitHub Status
//
//  Created by Rinalds Domanovs on 13/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var components = [Component]()

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkController.shared.fetchComponents { (data) in
            if let data = data {
                DispatchQueue.main.async {
                    self.components = data.components
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return components.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatusCell", for: indexPath) as! CustomTableViewCell
        let component = components[indexPath.row]
        cell.nameLabel.text = component.name
        cell.statusLabel.text = component.status.capitalized
        return cell
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

