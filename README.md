# Flutter-AutomaticDI

Simple flutter project (standard counter app) to test the automatic dependency injection.

## Getting Started

1. Used packages:

- mobx for state management
- provider to inject and share mobx store
- get_it + injectable - service locator and dependency injector

2. Installation

App was built using Flutter 3.29.0 and Dart 3.7.0 + fvm was used to manage flutter and dart versions. FVM is not required to run the project, but you can use it to set the proper flutter and dart versions. Documentation: https://fvm.app/documentation/getting-started

Minimal SDKs required to run the project:

- dart: >= 3.7.0-0 <4.0.0
- flutter: >= 3.18.0-18.0.pre.54

FVM installation (optional):

- on macOS: brew tap leoafarias/fvm + brew install fvm
- on Windows: choco install fvm
- fvm install [version]: for example fvm install 3.29.0

Running project:

- fvm use 3.29.0
- fvm flutter pub get -> to get dependencies
- select device and then Run from toolbar: -> start debugging/run without debugging
