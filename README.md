# Flutter-SWAPI

App is integrated with SWAPI (https://swapi.dev/). It fetches data and displays it as a list. You can refresh data. You can also select/deselect multiply items on the list and go to the second screen to see details about selected people. If fetching data fails, you will see proper message.

## Getting Started

1. Used packages:

- bloc for state management
- provider to inject app dependencies
- retrofit for http requests
- freezed for data models and for integration with bloc
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
   - core module - contains dependency injection, interfaces implementation. Depends on base module
   - state module - contains BLoC/Cubits. Depends on base and core module
   - UI module - contains widgets. Depends on connector module and state module to retrieve cubits.
   - connector module - is a bridge between base/core modules and UI module.

   Using BLoC/Cubit for state management (modules/state/lib -> cubit). Created modules to group cubits (modules/state/lib -> cubit -> modules) and CubitFactory (modules/state/lib -> cubit -> factory -> cubit_factory.dart) as a container for modules. Thanks to that, maintaining app state could be easier and cleaner, especially when app complexity grows. CubitFactory is a singleton (same as cubit modules). Lazy initialization has been implemented on modules, so they are initialized only when needed.

   Simple http requests logging is available.

   Running project with FVM:

   - fvm use 3.29.0
   - run `run_build.bat` (on Windows) or `run_build.sh` (on Linux/Mac) -> that will run pub get in all modules to get needed dependencies
   - select device and then Run from toolbar -> start debugging/run without debugging

   Running projected withouth FVM:

   - run `run_build_noFVM.bat` (on Windows) or `run_build_noFVM.sh` (on Linux/Mac) -> that will run pub get in all modules to get needed dependencies
   - select device and then Run from toolbar -> start debugging/run without debugging

   TO DO:

   - add more customized widgets to UI module to reduce amount of the code and make code more readable and clean - for example custom widgets for ElevatedButton or ListView.builder. Plus, thanks to that widgets could be reused.
