import 'package:basic_progress_bar/utils/config.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  double value = 0;

  Future<void> _() async {
    await Future.delayed(const Duration(seconds: 1));
    value += 15;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await _();
      await _();
      await _();
      await _();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        child: BasicProgressBar(
          config: ProgressBarConfig.fixedValue(value: value),
        ),
      ),
    );
  }
}

class BasicProgressBar extends StatefulWidget {
  final double height;
  final Color? progressColor;
  final Color? backgroundColor;
  final Duration animationDuration;
  final BorderRadius? borderRadius;
  final ProgressBarConfig config;

  const BasicProgressBar({
    super.key,
    required this.config,
    this.height = 30.0,
    this.progressColor,
    this.backgroundColor,
    this.borderRadius,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  State<BasicProgressBar> createState() => _BasicProgressBarState();
}

class _BasicProgressBarState extends State<BasicProgressBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _widthAnimation = Tween<double>(begin: 0.0, end: widget.config.calculateValue()).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _animateToNewValue();
  }

  @override
  void didUpdateWidget(covariant BasicProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.config.calculateValue() != widget.config.calculateValue()) {
      _animateToNewValue();
    }
  }

  void _animateToNewValue() {
    _widthAnimation = Tween<double>(
      begin: _widthAnimation.value,
      end: widget.config.calculateValue(),
    ).animate(_animationController);

    _animationController
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              width: constraints.maxWidth,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.backgroundColor ?? Colors.grey.shade200,
                borderRadius: widget.borderRadius ?? BorderRadius.circular(8.0),
              ),
            ),
            Container(
              height: widget.height,
              width: constraints.maxWidth * (_widthAnimation.value / 100),
              decoration: BoxDecoration(
                color: widget.progressColor ?? Colors.blue,
                borderRadius: widget.borderRadius ?? BorderRadius.circular(8.0),
              ),
            ),
          ],
        );
      },
    );
  }
}
