//
//  IncidentsTableViewController.swift
//  GitHub Status
//
//  Created by Rinalds Domanovs on 14/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class IncidentsTableViewController: UITableViewController {

    var incidents = [Incident]()

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkController.shared.fetchIncidentts { (data) in
            guard let data = data else { return }

            DispatchQueue.main.async {
                self.incidents = data.incidents
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incidents.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IncidentCell", for: indexPath)
        cell.textLabel?.text = incidents[indexPath.row].name
        return cell
    }

}
