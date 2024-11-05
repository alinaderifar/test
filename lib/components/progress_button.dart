import 'package:flutter/material.dart';

class ProgressButton extends StatefulWidget {
  /// The background color of the button.
  final Color color;

  /// The progress indicator color.
  final Color progressIndicatorColor;

  /// The size of the progress indicator.
  final double progressIndicatorSize;

  /// The border radius while NOT animating.
  final BorderRadius borderRadius;

  /// The duration of the animation.
  final Duration animationDuration;

  /// The stroke width of progress indicator.
  final double strokeWidth;

  /// Function that will be called at the on pressed event.
  ///
  /// This will grant access to its [AnimationController] so
  /// that the animation can be controlled based on the need.
  final Function(AnimationController) onPressed;

  /// The child to display on the button.
  final Widget child;

  ProgressButton({
    required this.child,
    required this.onPressed,
    this.color = Colors.blue,
    this.strokeWidth = 2,
    this.progressIndicatorColor = Colors.white,
    this.progressIndicatorSize = 30,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  _ProgressButtonState createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonStaggerAnimation(
        controller: _controller,
        color: widget.color,
        strokeWidth: widget.strokeWidth,
        progressIndicatorColor: widget.progressIndicatorColor,
        progressIndicatorSize: widget.progressIndicatorSize,
        borderRadius: widget.borderRadius,
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }
}

class ButtonStaggerAnimation extends StatelessWidget {
  // Animation fields
  final AnimationController controller;

  // Display fields
  final Color color;
  final Color progressIndicatorColor;
  final double progressIndicatorSize;
  final BorderRadius borderRadius;
  final double strokeWidth;
  final Function(AnimationController) onPressed;
  final Widget child;

  ButtonStaggerAnimation({
    required this.controller,
    required this.color,
    required this.progressIndicatorColor,
    required this.progressIndicatorSize,
    required this.borderRadius,
    required this.onPressed,
    required this.strokeWidth,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: _progressAnimatedBuilder);
  }

  Widget _buttonChild() {
    if (controller.isAnimating) {
      return Container();
    } else if (controller.isCompleted) {
      return SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          valueColor: AlwaysStoppedAnimation<Color>(progressIndicatorColor),
        ),
      );
    }
    return child;
  }

  AnimatedBuilder _progressAnimatedBuilder(
      BuildContext context, BoxConstraints constraints) {
    var buttonHeight = (constraints.maxHeight != double.infinity)
        ? constraints.maxHeight
        : 60.0;

    Tween<double>(
      begin: constraints.maxWidth,
      end: buttonHeight,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    var borderRadiusAnimation = Tween<BorderRadius>(
      begin: borderRadius,
      end: BorderRadius.all(Radius.circular(buttonHeight / 2.0)),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ));

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadiusAnimation.value,
                ),
                backgroundColor: color,
              ),
              child: _buttonChild(),
              onPressed: () {
                this.onPressed(controller);
              },
            ),
          ],
        );
      },
    );
  }
}
