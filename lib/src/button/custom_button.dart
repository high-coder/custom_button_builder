import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

/// In case wondering about 2.5 px margin at the bottom it is being used
/// for the animation effect

/// to animated the on press of the button we are changing the box shadow of the button and also changing the margin
/// of the button by 2.5 pixels from the bottom to animate

/// this is supposed to be a custom button using which in theory we should be able
/// to create every possible combination of the every button

enum Pressed {
  pressed, // when it is pressed
  notPressed, // this is the default state of the button which is it is not pressed and is behaving as normal 3d button
}

class CustomButton extends StatefulWidget {
  // this can be used to give a title to the widget
  final String? title;

  // the name suggest that you can add a textWidget but it can be anything
  final Widget? child;

  // this can be used to give a custom gradient to the button
  final Gradient? gradient;

  // this is the background color of the button which does not include the shadow color
  final Color? backgroundColor;

  // this can be used to give a custom shadow to the button
  final List<BoxShadow>? boxShadow;

  final Decoration? decoration;

  final Widget? iconWidget; // Icon(Icons.abc)
  final String? assetPath; // can be an Svg or an Image asset

  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderRadius;

  // this is used to color the shadow of the button
  final Color? shadowColor;
  final Widget? subtitle;

  /// this can be used to pass in the value is the button is loading then circular progress will be shown
  final bool isLoading;

  // using this we can set the button property to vibrate or to not vibrate
  final bool vibrate;

  final List<Widget>? rowChildren;

  /// when isThreeD is on then also give a color to the button or the 3d effect
  /// won't be visible cause the bottom will take the same color as the shadow color
  /// that is being used to have the 3d effect on the button
  /// this will allow us to basically have 4 default values for the shadow
  /// set it to true to get the 3d effect which in simple terms is basically box shadow
  final bool isThreeD;

// reversing the position of the icon and the text
  final bool reversePosition;

  // this is the onpressed function that is executed when the button is pressed
  final void Function()? onPressed;
  final void Function(TapDownDetails)? onTapDown;

  /// this is the value of the button when the animate property is set to true and isThree is also true then
  /// using this value we can have the disabled button effect where the button is pressed inside using the Pressed.pressed value
  /// and using the default value Pressed.notPressed the button can be restored to 3d version

  final Pressed pressed;

  // if you want to change the crossAxis value of the column when you give a subtitle
  //and title to the button then this can be used
  final CrossAxisAlignment crossAxis;

  /// width of the button
  final double? width;

  /// height of the button when the button's animate property is set to true then the user has to give a height value to the button
  /// or the button will not work
  final double? height;

  /// used to give the mainAxis value to the row
  final MainAxisAlignment mainAxis;

  /// the core property of the widget default value is false but the user can set it to true and the button will start animating if isThreeD is also true
  final bool animate;

  const CustomButton({
    this.pressed = Pressed.notPressed,
    super.key,
    this.vibrate = true,
    this.shadowColor,
    this.crossAxis = CrossAxisAlignment.start,
    this.subtitle,
    this.onTapDown,
    this.rowChildren,
    this.mainAxis = MainAxisAlignment.center,
    this.width,
    this.height,
    this.isThreeD = false,
    required this.onPressed,
    this.reversePosition = false,
    this.title,
    this.child,
    this.gradient,
    this.backgroundColor,
    this.iconWidget,
    this.assetPath,
    this.boxShadow,
    this.margin,
    this.padding,
    this.borderRadius,
    this.animate = false,
    this.decoration,
    this.isLoading = false, // showing the loading in the button itself
  })  : assert(backgroundColor == null || gradient == null),
        assert(iconWidget == null || assetPath == null),
        assert(decoration == null ||
            (backgroundColor == null && boxShadow == null)),
        assert(child == null || (title == null)),
        assert(rowChildren == null ||
            (title == null &&
                child == null &&
                assetPath == null &&
                iconWidget == null)),
        assert((!(animate == true && height == null))),
        assert(!((pressed == Pressed.pressed && animate == false)));

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  bool animationStart = false;
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _animation = Tween<double>(end: 1.5, begin: 4).animate(_controller!)
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  bool change = false;

  /// this function is responsible for the magic when the button default value is set to Pressed.pressed this triggers the controller to move forward
  /// and once the value is back to Pressed.notPressed then the controller is reversed to the original position
  void _checkState() {
    Pressed pressed = widget.pressed;

    if (pressed == Pressed.notPressed) {
      if (change) {
        return;
      }
      animationStart = false;
      change = true;
      _controller?.reverse();
    }

    if (widget.animate && pressed == Pressed.pressed) {
      change = false;
      animationStart = true;
      _controller?.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkState();

    return widget.isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Center(
            child: Container(
              margin: widget.margin,
              padding: widget.padding,
              width: widget.width,
              height: widget.animate && widget.height != null
                  ? widget.height! + 2.5
                  : widget.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DecoratedBox(
                    decoration: widget.decoration ??
                        BoxDecoration(
                            borderRadius: widget.borderRadius != null
                                ? BorderRadius.circular(
                                    widget.borderRadius ?? 0)
                                : null,
                            gradient: widget.gradient,
                            color: widget.isThreeD
                                ? widget.backgroundColor
                                : Colors.black,
                            boxShadow: widget.isThreeD == true
                                ? widget.boxShadow ??
                                    [
                                      //bottom
                                      BoxShadow(
                                        color: widget.shadowColor ??
                                            const Color(0xff706AFD),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        offset:
                                            Offset(0, _animation?.value ?? 4),
                                      ),
                                      BoxShadow(
                                        color: widget.shadowColor ??
                                            const Color(0xff706AFD),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        offset: const Offset(0, -1.5),
                                      ),
                                      BoxShadow(
                                        color: widget.shadowColor ??
                                            const Color(0xff706AFD),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        offset: const Offset(1.5, 0),
                                      ),
                                      BoxShadow(
                                        color: widget.shadowColor ??
                                            const Color(0xff706AFD),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        offset: const Offset(-1.5, 0),
                                      ),
                                    ]
                                : null
                            // to create a 3d style button use the box shadow only

                            ),
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        onTapDown: widget.onPressed != null
                            ? (value) {
                                if (widget.animate) {
                                  setState(() {
                                    animationStart = true;
                                    _controller?.forward();
                                  });
                                }
                                if (widget.vibrate) {
                                  HapticFeedback.lightImpact();
                                }
                                widget.onTapDown;
                              }
                            : null,
                        onTapCancel: () async {
                          if (widget.animate) {
                            animationStart = false;
                            _controller?.reverse();
                            setState(() {});
                          }
                        },
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius ?? 0),
                        onTapUp: widget.onPressed != null
                            ? (_) async {
                                bool condition = true;

                                if (widget.animate && condition) {
                                  animationStart = !animationStart;

                                  if (animationStart) {
                                    _controller?.forward();
                                  } else {
                                    _controller?.reverse();
                                  }
                                  setState(() {});
                                }
                                widget.onPressed!();
                              }
                            : null,
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius ?? 0),
                            color: widget.backgroundColor,
                          ),
                          child: Container(
                            height: widget.height,
                            width: widget.width,
                            padding: widget.padding,
                            child: Center(
                                child: Row(
                              mainAxisAlignment: widget.mainAxis,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: widget.reversePosition
                                  ? listOfRow().reversed.toList()
                                  : widget.rowChildren ?? listOfRow(),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  widget.animate
                      ? AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          height: !animationStart ? 2.5 : 0,
                          width: double.infinity,
                        )
                      : Container(),
                ],
              ),
            ),
          );
  }

  List<Widget> listOfRow() {
    return [
      Builder(
        builder: (context) {
          if (widget.iconWidget != null) {
            return Padding(
                padding: EdgeInsets.only(
                  right: widget.reversePosition ? 0 : 10,
                  left: widget.reversePosition ? 10 : 0,
                ),
                child: widget.iconWidget!);
          } else if (widget.assetPath != null) {
            // figure out if it is svg or normal asset
            bool isSvg = widget.assetPath?.contains(".svg") ?? false;
            if (isSvg) {
              return Padding(
                padding: EdgeInsets.only(
                  right: widget.reversePosition ? 0 : 10,
                  left: widget.reversePosition ? 10 : 0,
                ),
                child: SvgPicture.asset(
                  widget.assetPath!,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.only(
                  right: widget.reversePosition ? 0 : 10,
                  left: widget.reversePosition ? 10 : 0,
                ),
                child: Image.asset(
                  widget.assetPath!,
                  height: 24,
                ),
              );
            }
          } else {
            return Container();
          }
        },
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: widget.crossAxis,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: widget.child ??
                  Text(
                    widget.title ?? "",
                    style: const TextStyle(color: Colors.white),
                  ),
            ),
            widget.subtitle != null
                ? Flexible(
                    child: widget.subtitle!,
                  )
                : Container()
          ],
        ),
      )
    ];
  }
}
