//
//  Result.swift
//  Movies
//
//  Created by Prince Alvin Yusuf on 20/06/2021.
//  Copyright © 2021 Prince Alvin Yusuf. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(ErrorModel)
}
