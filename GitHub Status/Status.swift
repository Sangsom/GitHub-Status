//
//  Status.swift
//  GitHub Status
//
//  Created by Rinalds Domanovs on 13/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import Foundation

struct StatusResponse: Codable {
    var status: Status
}

struct Status: Codable {
    var description: String
    var indicator: String
}
