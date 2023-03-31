# weather_flutter

Flutter Weather Tutorial

## Getting Started

In this tutorial, we're going to build a Weather app in Flutter which demonstrates how to manage multiple cubits to implement dynamic theming, pull-to-refresh, and much more. Our weather app will pull live weather data from the public OpenMeteo API and demonstrate how to separate our application into layers (data, repository, business logic, and presentation).

## Project Requirements
# Our app should let users
- Search for a city on a dedicated search page
- See a pleasant depiction of the weather data returned by [Open Meteo API](https://open-meteo.com/)
- Change the units displayed (metric vs imperial)

# Additionally,
- The theme of the application should reflect the weather for the chosen city
- Application state should persist across sessions: i.e., the app should remember its state after closing and reopening it (using [HydratedBloc](https://github.com/felangel/bloc/tree/master/packages/hydrated_bloc))


## Key Concepts
- Observe state changes with BlocObserver
- BlocProvider, Flutter widget that provides a bloc to its children
- BlocBuilder, Flutter widget that handles building the widget in response to new states
- Prevent unnecessary rebuilds with Equatable
- RepositoryProvider, a Flutter widget that provides a repository to its children
- BlocListener, a Flutter widget that invokes the listener code in response to state changes in the bloc
- MultiBlocProvider, a Flutter widget that merges multiple BlocProvider widgets into one
- BlocConsumer, a Flutter widget that exposes a builder and listener in order to react to new states
- HydratedBloc to manage and persist state

## Project Structure
Our app will consist of isolated features in corresponding directories. This enables us to scale as the number of features increases and allows developers to work on different features in parallel.

Our app can be broken down into four main features: search, settings, theme, weather. Let's create those directories.

flutter_weather
|-- lib/
  |-- search/
  |-- settings/
  |-- theme/
  |-- weather/
  |-- main.dart
|-- test/

## Architecture
Following the [bloc architecture](https://bloclibrary.dev/#/architecture) guidelines, our application will consist of several layers.

In this tutorial, here's what these layers will do:
- Data: retrieve raw weather data from the API
- Repository: abstract the data layer and expose domain models for the application to consume
- Business Logic: manage the state of each feature (unit information, city details, themes, etc.)
- Presentation: display weather information and collect input from users (settings page, search page etc.)

# Data Layer
For this application we'll be hitting the Open Meteo API.

We'll be focusing on two endpoints:

https://geocoding-api.open-meteo.com/v1/search?name=$city&count=1 to get a location for a given city name
https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current_weather=true to get the weather for a given location
Open https://geocoding-api.open-meteo.com/v1/search?name=chicago&count=1 in your browser to see the response for the city of Chicago. We will use the latitude and longitude in the response to hit the weather endpoint.

The latitude/longitutde for Chicago is 41.85003/-87.65005. Navigate to https://api.open-meteo.com/v1/forecast?latitude=43.0389&longitude=-87.90647&current_weather=true in your browser and you'll see the response for weather in Chicago which contains all the data we will need for our app.

# OpenMeteo API Client
The OpenMeteo API Client is independent of our application. As a result, we will create it as an internal package (and could even publish it on pub.dev). We can then use the package by adding it to the pubspec.yaml for the repository layer, which will handle data requests for our main weather application.

Create a new directory on the project level called packages. This directory will store all of our internal packages.

Within this directory, run the built-in flutter create command to create a new package called open_meteo_api for our API client.

    flutter create --template=package open_meteo_api

### Weather Data Model
Next, let's create location.dart and weather.dart which will contain the models for the location and weather API endpoint responses.

flutter_weather
|-- lib/
|-- test/
|-- packages/
  |-- open_meteo_api/
    |-- lib/
      |-- src/
        |-- models/
          |-- location.dart
          |-- weather.dart
    |-- test/






