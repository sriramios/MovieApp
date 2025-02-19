# MovieApp
SwiftUI 

MovieApp is a SwiftUI-based app that allows users to discover and browse TV shows. Using the power of SwiftUI and Combine, the app fetches and displays TV show data from the TVMaze API. This app showcases how to use modern iOS development tools like SwiftUI for UI and Combine for reactive programming.

Features

Browse TV Shows: Explore a list of popular TV shows available in the API.
Search TV Shows: Search for TV shows by title.
TV Show Details: View detailed information about each TV show such as summary, image, genres, and rating.
SwiftUI: Built entirely using SwiftUI to demonstrate declarative UI development.
Combine: Utilizes Combine framework to handle asynchronous data fetching and state management.
Screenshots

![alt text](https://github.com/sriramios/MovieApp/blob/main/sampleScreens.gif) 

Requirements

iOS 14.0 or later
Xcode 12.0 or later
Swift 5.0 or later
Installation

Follow these steps to get the MovieApp up and running on your machine:

Clone the repository:
git clone https://github.com/sriramios/MovieApp.git
Open the project in Xcode:
open MovieApp.xcodeproj
Build and run the project on your simulator or device.
Configuration

There are no external API keys required for this project since it uses the public TVMaze API.

Usage

Browse TV Shows: The home screen displays a list of TV shows. Scroll through the list and tap on any show to view more details.
Search TV Shows: Use the search bar to find TV shows by their title.
View TV Show Details: Tap on a TV show to see its detailed information, including its summary, image, genres, and rating.
Architecture

The MovieApp utilizes a clean and modern SwiftUI architecture combined with the power of Combine for data handling:

Model: Represents the data structure for TV shows. This includes properties like id, name, summary, genres, and rating.
View: SwiftUI views are used to build the app’s user interface. The main view contains a list of TV shows, and a detailed view is used to show more information about a selected show.
ViewModel: The view model handles the logic for fetching TV show data from the TVMaze API using Combine's Publisher. It manages the state of the UI by using @Published properties to notify the UI when data is ready or errors occur.

Networking: The APIClient class uses Combine to make network requests to fetch TV show data from https://api.tvmaze.com/shows.
