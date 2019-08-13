//
//  NetworkController.swift
//  GitHub Status
//
//  Created by Rinalds Domanovs on 13/08/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import Foundation

class NetworkController {
    static let shared = NetworkController()

    let baseURL = URL(string: "https://kctbh9vrtdwd.statuspage.io/api/v2/")!

    func fetchComponents(completion: @escaping (Components?) -> Void) {
        let url = baseURL.appendingPathComponent("components.json")
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()

            if let data = data,
                let componentData = try? decoder.decode(Components.self, from: data){
                completion(componentData)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
