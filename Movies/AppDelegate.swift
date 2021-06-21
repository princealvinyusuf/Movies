//
//  AppDelegate.swift
//  Movies
//
//  Created by Prince Alvin Yusuf on 20/06/2021.
//  Copyright © 2021 Prince Alvin Yusuf. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupStatusBar()
        setupAppearance()
        setupWindow()
        setupObservers()
        return true
    }
    
    func setupStatusBar() {
        
        if #available(iOS 13.0, *) {
            let statusBar = UIView(frame: UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
            statusBar.backgroundColor = UIColor.init(red: 237.0/255.0, green: 85.0/255.0, blue: 61.0/255.0, alpha: 1.0)
            UIApplication.shared.keyWindow?.addSubview(statusBar)
        } else {
            UIApplication.shared.statusBarView?.backgroundColor = Config.purple
        }
        
    }
    
    func setupAppearance() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = Config.purple
        navigationBarAppearance.tintColor = Config.black
        navigationBarAppearance.isTranslucent = true
        navigationBarAppearance.shadowImage = UIImage()
        navigationBarAppearance.backgroundColor = Config.purple
        navigationBarAppearance.titleTextAttributes = [NSAttributedStringKey.foregroundColor : Config.black]
        navigationBarAppearance.setBackgroundImage(UIImage(), for: .default)
        
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.barTintColor = Config.purple
        tabBarAppearance.tintColor = Config.black
        tabBarAppearance.isTranslucent = true
        tabBarAppearance.shadowImage = UIImage()
        tabBarAppearance.backgroundColor = Config.purple
        
        UISearchBar.appearance().backgroundColor = Config.purple
    }
    
    func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.tintColor = Config.black
        
        let movieApi = MovieApi()
        
        let popularViewController = PopularViewController(movieApi: movieApi)
        popularViewController.tabBarItem = UITabBarItem(title: "Popular", image: #imageLiteral(resourceName: "list_icon"), tag: 0)
        let popularNavigationController = UINavigationController(rootViewController: popularViewController)
        
        let favoritesViewController = FavoritesViewController()
        favoritesViewController.tabBarItem = UITabBarItem(title: "Favorites", image: #imageLiteral(resourceName: "favorite_empty_icon"), tag: 1)
        let favoritesNavigationController = UINavigationController(rootViewController: favoritesViewController)
        
        let rootViewController = RootViewController(popularNavigationController: popularNavigationController, favoritesNavigationController: favoritesNavigationController)
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    func setupObservers() {
        NotificationCenter.default.addObserver(forName: .onMovieFavorited, object: nil, queue: nil) { (notification) in
            if let movie = notification.userInfo?["movie"] as? Movie {
                var cachedMovies = Movie.getCachedMovies()
                
                if let isFavorite = movie.isFavorite, isFavorite {
                    cachedMovies.append(movie)
                } else {
                    if let index = cachedMovies.index(where: { $0 == movie }) {
                        cachedMovies.remove(at: index)
                    }
                }
                
                Movie.saveCachedMovies(cachedMovies)
            }
        }
    }
}

