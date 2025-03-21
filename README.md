# Flutter-SWAPI

App is integrated with SWAPI (https://swapi.dev/). It fetches data and displays it as a list. You can select/deselect multiply items on the list and go to the second screen to see details about selected people. If fetching data fails, you will see proper message.

Login to app has been added to check how redirect (from go_router package) works. To login please use user: `admin` and password: `admin123`.
After successful login you will be redirected to home screen, otherwise you will see error message.

App has switch to toggle between single and multi selection option. Setting is saved locally.

## Getting Started

1. Used packages:

- bloc for state management
- go_router for navigation
- provider to inject app dependencies
- retrofit for http requests (along with Interceptors -> modules/core/lib/networking/interceptors)
- freezed for data models and for integration with bloc
- get_it + injectable - service locator and dependency injector
- shared_preferences - local storage (settings, saving auth token)

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

   - base module - contains interfaces, data models <- `domain layer`
   - core module - contains dependency injection, interfaces implementation. Depends on base module <- `data layer`
   - state module - contains BLoC/Cubits. Depends on base and core module
   - UI module - contains widgets routing and UI related services. Depends on connector module and state module to retrieve cubits. <- `presentation layer`
   - connector module - is a bridge between base/core modules and UI module.

   Using BLoC/Cubit for state management (modules/state/lib -> cubit). Created modules to group cubits (modules/state/lib -> cubit -> modules) and CubitFactory (modules/state/lib -> cubit -> factory -> cubit_factory.dart) as a container for modules. Thanks to that, maintaining app state could be easier and cleaner, especially when app complexity grows. CubitFactory is a singleton (same as cubit modules). Lazy initialization has been implemented on modules, so they are initialized only when needed.

   Simple http requests logging is available.

   After successful login, auth token is saved in shared preferences -> see `AuthCubit` class (modules/state/lib/cubit/cubits/auth/auth_cubit.dart). If endpoint is not in public list, token will be added to the request header -> see `RequestInterceptor` class (modules/core/lib/networking/interceptors/request_interceptor.dart). Generally, SWAPI has public endpoints, so token is not required. Saving and passing token was only made for the purpose of this app.

   Running project with FVM:

   - fvm use 3.29.0
   - run `run_build.bat` (on Windows) or `run_build.sh` (on Linux/Mac) -> that will run pub get in all modules to get needed dependencies
   - select device -> open main.dart file from lib folder -> and then Run from toolbar -> start debugging/run without debugging

   Running projected withouth FVM:

   - run `run_build_noFVM.bat` (on Windows) or `run_build_noFVM.sh` (on Linux/Mac) -> that will run pub get in all modules to get needed dependencies
   - select device -> open main.dart file from lib folder -> and then Run from toolbar -> start debugging/run without debugging
