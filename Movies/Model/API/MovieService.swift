//
//  MovieService.swift
//  Movies
//
//  Created by Prince Alvin Yusuf on 20/06/2021.
//  Copyright © 2021 Prince Alvin Yusuf. All rights reserved.
//

import Foundation

protocol MovieService: Service {
    func getPopularMovies(page: Int, completion: @escaping Response<PopularMoviesResponse>)
    func getGenres(completion: @escaping Response<[Genre]>)
}
