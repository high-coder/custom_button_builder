<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Custom Button Builder

Custom Button Builder lets you create beautiful 3d buttons, icon buttons, you can include your assets images as well, main focus is to create 3d buttons.

## Installation
1. Add the latest version of package to your pubspec.yaml (and run `dart pub get`):
```yaml
dependencies:
  custom_button_builder: ^0.0.1
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:custom_button_builder/custom_button_builder.dart';
```
# Demo
<img src='https://raw.githubusercontent.com/high-coder/public_images/main/images/buttons.gif' width=276px style="display:block; margin-left:auto;margin-right:auto;">

## Get Started
### ThreeD Animating button

<img src='https://raw.githubusercontent.com/high-coder/public_images/main/images/button1.gif' width=276px style="display:block; margin-left:auto;margin-right:auto;"/>
<br/>


```dart
CustomButton(
    width: 300,
    backgroundColor: Colors.white,
    isThreeD: true,
    height: 50,
    borderRadius: 25,
    animate: true,
    margin: const EdgeInsets.all(10),
    onPressed: () {},
    child: Text(
        "Continue",
    ),
),
```

### Pressed and unpressed

<img src='https://github.com/high-coder/public_images/blob/main/images/pressed_buttons.gif?raw=true' width=276px style="display:block; margin-left:auto;margin-right:auto;"/>
<br/>

```dart
CustomButton(
    width: 100,
    backgroundColor: Colors.blue,
    height: 100,
    borderRadius: 100,
    isThreeD: true,
    animate: true,
    shadowColor: Colors.red,
    pressed: Pressed.pressed,
    margin: const EdgeInsets.all(10),
    onPressed: () {},
    child: const Icon(
    Icons.abc,
    size: 50,
    color: Colors.white,
    ),
),
```

Using the Pressed.pressed value the button will be disabled, you can combine your choice of statemangement solution and enable one of the buttons and the rest can be disabled giving a look of knobs



## Additional information
Checkout the example on github
