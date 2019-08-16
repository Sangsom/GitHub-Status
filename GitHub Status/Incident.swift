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
    let incidentUpdates: [IncidentUpdate]

    enum CodingKeys: String, CodingKey {
        case name
        case status
        case incidentUpdates = "incident_updates"
    }
}

struct IncidentUpdate: Codable {
    let id: String
    let incidentId: String
    let body: String
    let status: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case incidentId = "incident_id"
        case body
        case status
        case updatedAt = "updated_at"
    }
}
