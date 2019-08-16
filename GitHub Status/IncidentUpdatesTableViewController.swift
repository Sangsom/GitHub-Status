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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incidentUpdates.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IncidentUpdateCell", for: indexPath)
        cell.textLabel?.text = incidentUpdates[indexPath.row].body
        return cell
    }

}
