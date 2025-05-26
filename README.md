
# How's the weather

Check the weather according to your location.

## About

This app was developed to fulfill the coding assignment requirements for a position at Olly Olly.

## Features

- User authentication
- Current weather data visualization 
  
## Technologies Used

- **Flutter Web** - Main framework
- **Dart** - Programming language
- **Bloc** - State management
- **GetIt** - Dependency injection
- **Dio** - HTTP requests
- **Material Design** - UI/UX

## Prerequisites

- Flutter SDK (version 3.27.4)
- Dart SDK (version 3.6.2+)
- Chrome (web browser)
- Git

## Installation and Setup

### 1. Clone the repository
```bash  
git clone https://github.com/The-ivo/Hows-the-weather.git
cd Hows-the-weather
```

### 2. Install dependencies
flutter pub get

### 3. Run the project
flutter run -d chrome

## Testing
# Run all tests
flutter test

## Project Structure
```bash
lib
├─┬─ ui
│ ├─┬─ core
│ │ └─── themes
│ │
│ └─┬─ Feature
│   ├── Blocs
│   └── widgets
│
├─┬─ domain
│ └── models
│   
├─┬─ data
│ ├── repositories
│ ├── services
│ └── model
│   
├─── config
├─── utils
├─── routing
└─── main.dart

// The test folder contains unit and widget tests
test
├─── data
└── ui
```

