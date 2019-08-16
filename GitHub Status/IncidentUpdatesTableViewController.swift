//
//  IncidentUpdatesTableViewController.swift
//  GitHub Status
//
//  Created by Rinalds Domanovs on 16/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class IncidentUpdatesTableViewController: UITableViewController {

    var incidentUpdates = [IncidentUpdate]()
    var incidentName: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = incidentName
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incidentUpdates.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IncidentUpdateCell", for: indexPath) as! IncidentUpdatedDetailsCell
        updateCellUI(cell, indexPath: indexPath)
        return cell
    }

    func updateCellUI(_ cell: IncidentUpdatedDetailsCell, indexPath: IndexPath) {
        let incident = incidentUpdates[indexPath.row]
        cell.idLabel.text = incident.id
        cell.incidentIdLabel.text = incident.incidentId
        cell.statusLabel.text = incident.status
        cell.bodyLabel.text = incident.body
        cell.updatedAtLabel.text = incident.updatedAt

        if incident.status == "resolved" {
            cell.backgroundColor = UIColor(red: 39 / 255, green: 174 / 255, blue: 96 / 255, alpha: 1)
        } else {
            cell.backgroundColor = UIColor(red: 231 / 255, green: 76 / 255, blue: 60 / 255, alpha: 1)
        }
    }
}
