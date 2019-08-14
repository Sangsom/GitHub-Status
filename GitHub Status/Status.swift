//
//  Status.swift
//  GitHub Status
//
//  Created by Rinalds Domanovs on 13/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import Foundation

struct StatusResponse: Codable {
    let status: Status
}

struct Status: Codable {
    let description: String
    let indicator: String
}
