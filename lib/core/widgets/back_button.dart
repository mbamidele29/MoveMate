import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackButtonWidget extends StatefulWidget {
  const BackButtonWidget({super.key});

  @override
  State<BackButtonWidget> createState() => _BackButtonWidgetState();
}

class _BackButtonWidgetState extends State<BackButtonWidget>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _animation;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this)
      ..forward();
    _animation = Tween<Offset>(
      end: const Offset(0, 0),
      begin: const Offset(-1, 0),
    ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: IconButton(
        icon: Icon(
          Icons.chevron_left_rounded,
          color: Colors.white,
          size: 40.w,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
