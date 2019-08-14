//
//  Incident.swift
//  GitHub Status
//
//  Created by Rinalds Domanovs on 14/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import Foundation

struct Incidents: Codable {
    let incidents: [Incident]
}

struct Incident: Codable {
    let name: String
    let status: String
}
