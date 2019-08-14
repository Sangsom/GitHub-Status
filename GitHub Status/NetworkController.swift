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
            guard let data = data else { return }
            let decoder = JSONDecoder()

            if let componentData = try? decoder.decode(Components.self, from: data){
                completion(componentData)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }

    func fetchStatus(completion: @escaping (StatusResponse?) -> Void) {
        let url = baseURL.appendingPathComponent("status.json")
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()

            if let status = try? decoder.decode(StatusResponse.self, from: data) {
                completion(status)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }

    func fetchIncidentts(completion: @escaping (Incidents?) -> Void) {
        let url = baseURL.appendingPathComponent("incidents.json")
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()

            if let incidents = try? decoder.decode(Incidents.self, from: data) {
                completion(incidents)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
