import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ButtonVariations());
}

class ButtonVariations extends StatelessWidget {
  const ButtonVariations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                width: 300,
                backgroundColor: Colors.white,
                isThreeD: true,
                height: 50,
                borderRadius: 25,
                // pressed: Pressed.pressed,
                animate: true,
                margin: const EdgeInsets.all(10),
                onPressed: () {},
                child: const Text(
                  "Continue",
                ),
              ),
              CustomButton(
                width: 300,
                backgroundColor: Colors.white,
                isThreeD: true,
                height: 50,
                borderRadius: 25,
                // pressed: Pressed.pressed,
                animate: true,
                margin: const EdgeInsets.all(10),
                onPressed: () {},
                iconWidget: const Icon(
                  Icons.abc,
                  size: 30,
                ),

                child: const Text(
                  "Continue",
                ),
              ),
              CustomButton(
                width: 300,
                backgroundColor: Colors.white,
                isThreeD: true,
                height: 50,
                borderRadius: 25,
                // pressed: Pressed.pressed,
                animate: true,
                margin: const EdgeInsets.all(10),
                onPressed: () {},
                iconWidget: const Icon(
                  Icons.abc,
                  size: 30,
                ),
                reversePosition: true,
                child: const Text(
                  "Continue",
                ),
              ),
              CustomButton(
                width: 300,
                backgroundColor: Colors.white,
                isThreeD: true,
                height: 50,
                borderRadius: 25,
                shadowColor: Colors.black,
                // pressed: Pressed.pressed,
                animate: true,
                margin: const EdgeInsets.all(10),
                onPressed: () {},
                iconWidget: const Icon(
                  Icons.abc,
                  size: 30,
                ),
                reversePosition: true,
                child: const Text(
                  "Continue",
                ),
              ),
              CustomButton(
                width: 300,
                backgroundColor: Colors.white,
                isThreeD: true,
                height: 50,
                borderRadius: 25,
                shadowColor: Colors.black,
                pressed: Pressed.pressed,
                animate: true,
                margin: const EdgeInsets.all(10),
                onPressed: () {},
                iconWidget: const Icon(
                  Icons.abc,
                  size: 30,
                ),
                reversePosition: true,
                child: const Text(
                  "Continue",
                ),
              ),
              CustomButton(
                width: 300,
                backgroundColor: Colors.blue,
                height: 50,
                borderRadius: 25,

                // pressed: Pressed.pressed,

                margin: const EdgeInsets.all(10),
                onPressed: () {},
                iconWidget: const Icon(
                  Icons.abc,
                  size: 30,
                  color: Colors.white,
                ),
                reversePosition: true,
                child: const Text(
                  "Continue",
                ),
              ),
              CustomButton(
                gradient:
                    const LinearGradient(colors: [Colors.blue, Colors.red]),
                width: 300,
                // backgroundColor: Colors.blue,
                height: 60,
                borderRadius: 12,

                // pressed: Pressed.pressed,

                margin: const EdgeInsets.all(10),
                onPressed: () {},
                iconWidget: const Icon(
                  Icons.abc,
                  size: 30,
                  color: Colors.white,
                ),
                reversePosition: true,
                child: const Text(
                  "Continue",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    width: 100,

                    backgroundColor: Colors.blue,
                    height: 100,
                    borderRadius: 100,

                    // pressed: Pressed.pressed,

                    margin: const EdgeInsets.all(10),
                    onPressed: () {},
                    child: const Icon(
                      Icons.abc,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  CustomButton(
                    width: 100,

                    backgroundColor: Colors.blue,
                    height: 100,
                    borderRadius: 100,
                    isThreeD: true,
                    animate: true,
                    shadowColor: Colors.red,

                    // pressed: Pressed.pressed,

                    margin: const EdgeInsets.all(10),
                    onPressed: () {},
                    child: const Icon(
                      Icons.abc,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              CustomButton(
                width: 300,
                backgroundColor: Colors.blueAccent,
                height: 65,
                borderRadius: 12,
                animate: true,
                isThreeD: true,
                shadowColor: Colors.black,

                // pressed: Pressed.pressed,

                margin: const EdgeInsets.all(10),
                onPressed: () {},
                iconWidget: const Icon(
                  Icons.abc,
                  size: 30,
                  color: Colors.white,
                ),
                reversePosition: true,
                child: const Text(
                  "Continue",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
