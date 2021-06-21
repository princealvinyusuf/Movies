# Movies
Public Project for iOS Developer Test

# About Movies
Simple iOS Native App that provide information about popular movies using TheMovieDB API


# Technologies / Frameworks
* Foundation
* UIKit
* Interface Builder (Layouting using Storyboard)
* Cache (Storage / Data Persistence)
* Kingfisher (image downloading and processing libraries)


# Functionalities
* Main Screen showing popular movies, Local Data Search, and Infinite Scroll with Pagination
* Movie Detail Screen
* Favorites Screen displays data from a database containing a list of the user's favorite movies
* Filter Screen with release date and genre selection
* Error handling and presentation of exception flows: Empty Search, Generic Error, and Loading

# Reason using Cache Instead Of Realm
In this case I want to use a simple storage strategy where only the data that the user likes will go into storage and the data type like images(.jpg/.png) will easier to store with lightweight and flexible solution while using Cache.

# Screenshot
![alt text](https://github.com/princealvinyusuf/Movies/blob/main/images/images1.png?raw=true)
![alt text](https://github.com/princealvinyusuf/Movies/blob/main/images/images2.png?raw=true)
![alt text](https://github.com/princealvinyusuf/Movies/blob/main/images/images3.png?raw=true)
