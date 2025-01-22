
# Flutter App - Clean Architecture Using Bloc

This project follows the **Clean Architecture** principles to ensure maintainability, testability, and scalability. 
It is structured in a modular fashion with a separation of concerns, making it easy to add features and manage dependencies.

## Project Structure

```plaintext

lib
├── core                   # Core functionalities and shared components used throughout the app
│   ├── constants          # Defines static constants such as asset paths, API URLs, and keys
│   ├── colors             # Centralized color palette for maintaining consistent color usage
│   ├── enum               # Enum definitions for managing application states and reusable enums
│   ├── style              # Styling definitions like text styles, spacing, themes, and custom typography
│   ├── usecase            # Business logic for executing specific actions, keeping domain logic reusable
│   ├── validation         # Utilities for validating user inputs (e.g., form fields, regex checks)
│   └── error              # Handles application errors using custom exceptions and failure models
│
├── config                 # Configuration files for app-wide settings
│   ├── theme              # Global theme configuration for light/dark mode and color schemes
│   └── routes             # Route definitions and navigation configuration for the app
│
├── features               # Feature-based modules for adhering to clean architecture
│   ├── auth               # Authentication module, handling login, signup, and user sessions
│   │   ├── data           # Handles data-related functionality for authentication
│   │   │   ├── datasources  # Sources for fetching auth data (e.g., APIs, local storage)
│   │   │   ├── repositories # Implements repositories to abstract data source logic
│   │   │   └── entity       # Data models specific to API or local storage (e.g., API response models)
│   │   ├── domain         # Core business logic for authentication
│   │   │   ├── repositories # Abstract repository interfaces to enforce coding contracts
│   │   │   ├── model        # Domain-specific models representing business entities (e.g., User)
│   │   │   └── usecases     # Specific use cases like "LoginUser" or "RegisterUser"
│   │   └── presentation   # UI-related files and state management for authentication
│   │       ├── screen       # Screens like LoginPage, SignupPage, or ForgotPasswordPage
│   │       ├── widgets      # Custom widgets for authentication (e.g., input fields, buttons)
│   │       └── bloc         # BLoC files for managing authentication states and events
│   ├── splash             # Splash screen feature, initializing app dependencies and checking sessions
│   │   ├── data           # Handles splash-specific data (if needed, like remote config fetching)
│   │   ├── domain         # Splash-related domain logic (if required)
│   │   └── presentation   # UI and state management for the splash screen
│   └── users              # Features related to user functionality (e.g., profiles, settings, etc.)
│       ├── data           # User-specific data handling (e.g., API requests, local storage)
│       ├── domain         # Core logic for user actions (e.g., updating profiles, fetching details)
│       └── presentation   # UI and state management for user-related screens and interactions
│
├── utils                  # General utility classes and helper functions (e.g., shared preferences, API helpers)
│
├── widgets                # Shared and reusable widgets across the app (e.g., custom buttons, app bars)
│
├── injection_container.dart  # Dependency injection setup using packages like GetIt or Provider
│
└── main.dart                 # Entry point of the application, initializing app configurations and running the app

```

## Folder Details

### `core`
Contains the shared and essential components like constants, themes, color schemes, and common use cases that are reused throughout the app.

### `config`
- **Routes**: Manages all app routes in a centralized manner.
- **Themes**: Defines the global themes for the app.

### `features`
Each feature (e.g., `auth`, `users`, `splash`) follows the Clean Architecture structure:
  - **data**: Manages data sources, such as remote or local data access, and repository implementations.
  - **domain**: Contains business logic, use cases, and domain entities.
  - **presentation**: Handles UI, widgets, and BLoC/Cubit files for state management.

### `utils`
Contains helper classes or functions that may be used across the app, like navigation helpers and shared preferences.

### `widgets`
Reusable widgets that are shared across various parts of the application.

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)

### Installation

Clone the repository and install dependencies.

```bash
git clone https://github.com/DeepakStark123/flutter_clean_architecture_with_bloc
cd ecom
flutter clean
flutter pub get
```

### Running the App

```bash
flutter run
```

## State Management

This project uses the BLoC (Business Logic Component) library for state management, ensuring a reactive and maintainable UI.

## Adding New Features

1. **Create a new folder** in `features` following the structure (data, domain, presentation).
2. **Define the data models, repositories, and use cases** in the respective folders.
3. **Implement BLoC or Cubit for state management** in the `presentation` layer.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements.

---

### Note
This project structure is inspired by the Clean Architecture principles and provides a good foundation for scaling up your Flutter applications in a structured manner.
# flutter_clean_architecture
