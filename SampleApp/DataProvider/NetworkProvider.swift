//
//  NetworkProvider.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import UIKit

class NetworkProvider: Providable {
    func get<T: Codable>(_ type: T.Type, completion: @escaping (T?) -> Void) {
        let success = { (result: T?) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        let failure = {
            DispatchQueue.main.async {
                completion(nil)
            }
        }
        guard let url = URL(string: baseUrl+route(for: type)) else {
            failure()
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                failure()
                return
            }
            let result = try? JSONDecoder().decode(T.self, from: data)
            success(result)
        }
        task.resume()
    }
    
    func getImage(_ identifier: String, completion: @escaping (UIImage?) -> Void) {
        let success = { (result: UIImage?) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        let failure = {
            DispatchQueue.main.async {
                completion(nil)
            }
        }
        guard let url = URL(string: identifier) else {
            failure()
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                failure()
                return
            }
            let image = UIImage(data: data)
            success(image)
        }
        task.resume()
    }
    
    private var baseUrl: String {
        let path = Bundle.main.path(forResource: "EndPoints", ofType: "plist") ?? ""
        let plist = NSDictionary(contentsOfFile: path)
        return plist?["BaseUrl"] as? String ?? ""
    }
    
    private func route<T: Codable>(for type: T.Type) -> String {
        switch type {
        case is UserListEntity.Type:
            return "results=100"
        default:
            return ""
        }
    }
}
