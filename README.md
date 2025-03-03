# Flutter-AutomaticDI

Simple flutter project (standard counter app) to test the automatic dependency injection.

## Getting Started

1. Used packages:

- mobx for state management
- provider to inject mobx store
- get_it + injectable - service locator and dependency injector

2. Installation

App was built using Flutter 3.29.0 and Dart 3.7.0 + fvm was used to manage flutter and dart versions.

FVM installation:

- on macOS: brew tap leoafarias/fvm + brew install fvm
- on Windows: choco install fvm
- fvm install [version]: for example fvm install 3.29.0

Running project:

- fvm use 3.29.0
- fvm flutter pub get - to get dependencies
- select device and then Run from toolbar: -> start debugging/run without debugging
