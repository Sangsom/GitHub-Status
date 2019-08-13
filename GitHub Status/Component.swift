//
//  Component.swift
//  GitHub Status
//
//  Created by Rinalds Domanovs on 13/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import Foundation

struct Component: Codable {
    let name: String
    let status: String
    let description: String
}

struct Components: Codable {
    let components: [Component]
}
