import 'package:flutter/material.dart';

class BounceWidget extends StatefulWidget {
  final Widget child;
  final double? shrinkRate;
  final VoidCallback onPressed;

  const BounceWidget(
      {super.key,
      required this.onPressed,
      required this.child,
      this.shrinkRate});

  @override
  State<BounceWidget> createState() => _BounceWidgetState();
}

class _BounceWidgetState extends State<BounceWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 150), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward();
        Future.delayed(const Duration(milliseconds: 200), () {
          _controller.reverse();
        });
        widget.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 1.0,
          end: widget.shrinkRate ?? .8,
        ).animate(_controller),
        child: widget.child,
      ),
    );
  }
}
