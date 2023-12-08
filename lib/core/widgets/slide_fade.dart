import 'package:flutter/material.dart';

class SlideFadeWidget extends StatefulWidget {
  final Widget child;
  final bool resetAnimation;

  const SlideFadeWidget(
      {super.key, required this.child, this.resetAnimation = false});

  @override
  State<SlideFadeWidget> createState() => _SlideFadeWidgetState();
}

class _SlideFadeWidgetState extends State<SlideFadeWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this)
      ..forward();
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn));
    _slideAnimation = Tween<Offset>(
      end: const Offset(0, 0),
      begin: const Offset(0, .7),
    ).animate(
        CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SlideFadeWidget oldWidget) {
    if (widget.resetAnimation) {
      _controller?.reset();
      _controller?.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(opacity: _fadeAnimation, child: widget.child));
  }
}
