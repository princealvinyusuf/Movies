//
//  Headers.swift
//  Movies
//
//  Created by Prince Alvin Yusuf on 20/06/2021.
//  Copyright © 2021 Prince Alvin Yusuf. All rights reserved.
//

import UIKit

class Headers: NSObject {
    private(set) var values: Params = [:]
    
    func update(_ value: String, forKey key: String) {
        values.updateValue(value, forKey: key)
    }
}
