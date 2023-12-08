import 'package:flutter/material.dart';

class AnimatedCounterWidget extends StatefulWidget {
  final double endValue;
  final String? prefix;
  final String? suffix;
  final TextStyle style;
  final double beginValue;

  const AnimatedCounterWidget(
      {super.key,
      this.prefix,
      this.suffix,
      required this.style,
      required this.endValue,
      required this.beginValue});

  @override
  State<AnimatedCounterWidget> createState() => _AnimatedCounterWidgetState();
}

class _AnimatedCounterWidgetState extends State<AnimatedCounterWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    AnimationController controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this)
      ..forward()
      ..addListener(() {
        setState(() {});
      });
    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    animation = Tween<double>(begin: widget.beginValue, end: widget.endValue)
        .animate(curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${widget.prefix ?? ''}${animation.value.toStringAsFixed(0)}${widget.suffix ?? ''}',
      style: widget.style,
    );
  }
}
