# News App Repository

## Overview
This project implements a News app using the Clean Architecture approach. It includes data fetching from a remote API, caching mechanisms, and offline support. The repository follows best practices with unit tests for each layer.

## Features
- Fetch news articles from a remote data source.
- Cache news for offline access.
- Use the Repository Pattern to manage data sources.
- Apply the Clean Architecture principles.
- Unit tests with `mocktail`.

## Tech Stack
- **Flutter** (Dart)
- **Dio** for HTTP requests
- **sqflite** for local caching
- **Equatable** for value equality
- **Dartz** for functional programming
- **Mocktail** for testing

## Project Structure
```
lib/
│── core/                # Error handling, network info, utilities
│── datasources/         # Remote & offline data sources
│── models/              # Data models
│── repositories/        # Repository implementations
│── entities/            # Business logic entities
│── presentation/        # UI & state management
│── main.dart            # Entry point
```

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/news_app.git
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Run tests:
   ```sh
   flutter test
   ```
4. Run the app:
   ```sh
   flutter run
   ```
5. flutter version 3.27.1

## Testing
Unit tests are implemented using `flutter_test` and `mocktail`. To run tests:
```sh
flutter test
```




