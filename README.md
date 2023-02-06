# Quotify 📜

Famous things said by famous people, some not so famous.

## Overview 🖋️

This project is built with Flutter and Dart for iOS, Android and the Web.
It uses a multitude of dependencies in the pubspec.yaml - all used responsibly.
Here is how some are used:

- bloc, flutter_bloc and flutter_hooks: For state management
- injectable and get_it: For Dependency Injection
- dartz and freezed: For complex data classes and unions
- analyzer and build_runner: For generated classes

This project is built using DDD - Domain Driven Development, which focuses on separating layers of the project into different folders to enable readability, easy navigation and scalability. It consists of:

- Presentation Layer: UI widgets and everything that the user sees and interacts with.
- Domain Layer: Holds the data classes and interfaces, it is the bridge between the API calls and UI.
- Application Layer: Responsible for managing the state of the application.
- Infrastructure Layer: Where all the API calls reside.

### Features 💕

The quotify application has a range of features available to the user.

- `Fav quotes 💕` - the ability to like quotes.
- `UnFav quotes 💔` - the ability to unlike quotes.
- `Edit quotes 🖋️` - the ability to edit quotes.
- `Delete quotes 🗑️` - the ability to delete quotes.
- `Reset quotes 🌍` - the ability to refetch quotes from the internet.

## Building the application 🚀

To build the application,please clone the repo and ensure that in your terminal or CMD, you are in the folder called "quotify" and then run the following: `flutter pub get`

It is important to run `flutter pub run build_runner build --delete-conflicting-outputs` to generate necessary classes and code.

To run on an iOS Simulator or Android Emulator, please make sure that the virtual device is already open and simply run: `flutter run`

To run on a physical device, ensure that it is connected to the computer and then simply run: `flutter run`

To run on a web browser like Chrome, simply run: `flutter run -d chrome`

Cheers! 🚀

Nifemi.
