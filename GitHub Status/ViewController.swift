//
//  ViewController.swift
//  GitHub Status
//
//  Created by Rinalds Domanovs on 13/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    @IBOutlet var titleLabel: UILabel!

    var components = [Component]()

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkController.shared.fetchComponents { (data) in
            guard let data = data else { return }

            DispatchQueue.main.async {
                self.components = data.components
                self.tableView.reloadData()
            }
        }

        NetworkController.shared.fetchStatus { (data) in
            guard let data = data else { return }

            DispatchQueue.main.async {
                self.titleLabel.text = data.status.description
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return components.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatusCell", for: indexPath) as! CustomTableViewCell
        let component = components[indexPath.row]
        let status = component.status
        cell.nameLabel.text = component.name
        cell.detailsLabel.text = component.description
        cell.statusLabel.text = status.capitalized

        if status == "operational" {
            cell.statusLabel.textColor = UIColor(red: 39 / 255, green: 174 / 255, blue: 96 / 255, alpha: 1)
        } else if status == "degraded_performance" {
            cell.statusLabel.textColor = UIColor(red: 142 / 255, green: 68 / 255, blue: 173 / 255, alpha: 1)
        } else if status == "partial_outage" {
            cell.statusLabel.textColor = UIColor(red: 230 / 255, green: 126 / 255, blue: 34 / 255, alpha: 1)
        } else if status == "major_outage" {
            cell.statusLabel.textColor = UIColor(red: 231 / 255, green: 76 / 255, blue: 60 / 255, alpha: 1)
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

