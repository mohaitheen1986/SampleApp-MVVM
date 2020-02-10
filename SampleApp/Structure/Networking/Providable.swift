//
//  Providable.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import UIKit

protocol Providable {
    func get<T: Codable>(_ type: T.Type, completion: @escaping (T?) -> Void)
    func getImage(_ identifier: String, completion: @escaping (UIImage?) -> Void)
}
