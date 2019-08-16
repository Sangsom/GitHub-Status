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
        let incident = incidentUpdates[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "IncidentUpdateCell", for: indexPath) as! IncidentUpdatedDetailsCell
        cell.idLabel.text = "ID: \(incident.id)"
        cell.statusLabel.text = "Status: \(incident.status)"
        cell.bodyLabel.text = "Body: \(incident.body)"
        return cell
    }

}
