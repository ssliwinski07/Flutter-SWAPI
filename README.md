# Flutter-AutomaticDI

Simple flutter project (standard counter app with API integration) to test the automatic dependency injection and registring services. App is modular (more info below).

## Getting Started

1. Used packages:

- mobx for state management
- provider to inject and manage app state
- retrofit for http requests
- freezed for data models
- get_it + injectable - service locator and dependency injector

2. Installation and other information

   App was built using Flutter 3.29.0 and Dart 3.7.0 + FVM was used to manage flutter and dart versions. FVM is not required to run the project, but you can use it to set the proper flutter and dart versions. Documentation: https://fvm.app/documentation/getting-started

   Minimal SDKs required to run the project:

   - dart: >= 3.7.0-0 <4.0.0
   - flutter: >= 3.18.0-18.0.pre.54

   FVM installation (optional):

   - on macOS: brew tap leoafarias/fvm + brew install fvm
   - on Windows: choco install fvm
   - fvm install [version]: for example fvm install 3.29.0

   App is splitted into modules, to separate UI from core:

   - base module - contains interfaces
   - core module - contains dependency injection, interfaces implementation, mobx stores. Depends on base module
   - UI module - contains widgets. Depends on connector module
   - connector module - is a bridge between base, core modules and UI module. Contains getters for app state and app dependencies configuration. Depends on base and core modules

   State management is centralized with modules using MobX (modules/core/lib -> states -> mobx). Thanks to that, maintaining app state could be easier and cleaner, especially when app complexity grows. Lazy initialization has been implemented, so specific modules/data stores are not initialized until they are needed.

   App was integrated with SWAPI (https://swapi.dev/). It fetches data from SWAPI and displays it in the app. After running app you can see name of first person from SWAPI -> Luke Skywalker (or Mock Person when using mock environment). You can refresh data (that will be improved).

   Running project with FVM:

   - fvm use 3.29.0
   - run `run_build.bat` (on Windows) or `run_build.sh` (on Linux/Mac) -> that will run pub get in all modules to get needed dependencies
   - select device and then Run from toolbar -> start debugging/run without debugging

   Running projected withouth FVM:

   - run `run_build_noFVM.bat` (on Windows) or `run_build_noFVM.sh` (on Linux/Mac) -> that will run pub get in all modules to get needed dependencies
   - select device and then Run from toolbar -> start debugging/run without debugging
