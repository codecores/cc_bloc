[![pub package](https://img.shields.io/pub/v/http.svg)](https://pub.dev/packages/cc_bloc)

# CCBloc

CCBloc is a package developed to simplify the usage of BLoC (Business Logic Component) in Flutter applications. This package helps you manage BLoC operations more efficiently and in a more organized manner. Below are the main features of the package and usage examples.

## Features

- Simple and centralized BLoC management
- Easy access to handle loading and update states
- Dynamic management of modules and providers

## Installation

Add the following line to your `pubspec.yaml` file to include the package in your project:

```yaml
dependencies:
  cc_bloc: ^1.0.0
```

Then, run `flutter pub get` in the terminal to install the package.

## Usage

### 1. Managing BLoC with CCBloc

The `CCBloc` class allows you to manage and access your BLoCs.

#### Registering a BLoC

To register a BLoC class:

```dart
CCBloc.register(MainCubit());
```

#### Accessing a BLoC

To access a registered BLoC:

```dart
var cubit = CCBloc.getModule<MainCubit>();
```

#### Handling BLoC States

To handle loading and update states:

```dart
CCBloc.loading<MainCubit>();
CCBloc.updated<MainCubit>();
```

### 2. BLoC Class

Create a BLoC class and register it with CCBloc:

```dart
class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial()) {
    CCBloc.register(this);
  }

  void fetch() async {
    CCBloc.loading<MainCubit>();
    // Perform BLoC operations
    CCBloc.updated<MainCubit>();
  }
}
```

### 3. Widget Usage

Create a widget and apply the `CCProvider` mixin:

```dart
class MainPage extends CCStatelessWidget<MainCubit> {
  MainPage({Key? key}) : super(key: key);

  @override
  void loading() {
    print("Loading");
  }

  @override
  void updated() {
    print("Updated");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Text(
                '2',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
```

## Contributing

If you'd like to contribute, please submit pull requests or report issues.

## License

This package is licensed under the MIT License. See the `LICENSE` file for details.