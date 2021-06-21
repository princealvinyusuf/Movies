//
//  TypeAlias.swift
//  Movies
//
//  Created by Prince Alvin Yusuf on 20/06/2021.
//  Copyright © 2021 Prince Alvin Yusuf. All rights reserved.
//

import Foundation

typealias Params = [String: String]
typealias Response<T: Decodable> = (Result<T>) -> ()
