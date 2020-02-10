//
//  UIView.swift
//  SampleApp
//
//  Created by Mohaitheen on 10/02/20.
//  Copyright © 2020 Mohaitheen. All rights reserved.
//

import UIKit

extension UIView {
    func getSubviews<T: UIView>(type: T.Type) -> [T] {
        var result: [T] = []
        for subview in subviews {
            result += subview.getSubviews(type: type) as [T]
            if let subview = subview as? T {
                result.append(subview)
            }
        }
        return result
    }
    
  
}
