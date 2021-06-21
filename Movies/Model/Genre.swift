//
//  Genre.swift
//  Movies
//
//  Created by Prince Alvin Yusuf on 20/06/2021.
//  Copyright © 2021 Prince Alvin Yusuf. All rights reserved.
//

import Foundation

struct Genre: Codable {
    let id: Int
    let name: String
    
    fileprivate static var cachedGenres: [Genre] = []
    static func getGenres(movieApi: MovieService, completion: @escaping Response<[Genre]>) {
        if cachedGenres.isEmpty {
            movieApi.getGenres { (response) in
                switch response {
                case .success(let genres):
                    cachedGenres = genres
                    completion(Result.success(genres))
                case .error(let err):
                    completion(Result.error(err))
                }
            }
        } else {
            completion(Result.success(cachedGenres))
        }
    }
}

extension Genre {
    static func ==(lhs: Genre, rhs: Genre) -> Bool {
        return lhs.id == rhs.id
    }
}
