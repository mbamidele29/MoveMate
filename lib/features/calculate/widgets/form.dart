import 'package:flutter/material.dart';
import 'package:movemate/core/widgets/app_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'prefix.dart';

class CalculateFormWidget extends StatefulWidget {
  const CalculateFormWidget({super.key});

  @override
  State<CalculateFormWidget> createState() => _CalculateFormWidgetState();
}

class _CalculateFormWidgetState extends State<CalculateFormWidget>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _slideAnimation;
  @override
  void initState() {
    AnimationController controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this)
      ..forward();
    _slideAnimation = Tween<Offset>(
      end: const Offset(0, 0),
      begin: const Offset(0, 1),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: const Offset(1.8, 1.8),
            color: Colors.grey.withOpacity(.1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideTransition(
            position: _slideAnimation,
            child: const AppTextField(
              hintText: 'Sender location',
              prefixWidget:
                  CalculatePrefixWidget(icon: Icons.file_upload_outlined),
            ),
          ),
          15.verticalSpace,
          SlideTransition(
            position: _slideAnimation,
            child: const AppTextField(
                hintText: 'Receiver location',
                prefixWidget:
                    CalculatePrefixWidget(icon: Icons.file_download_outlined)),
          ),
          15.verticalSpace,
          SlideTransition(
            position: _slideAnimation,
            child: const AppTextField(
                hintText: 'Approx Weight',
                prefixWidget: CalculatePrefixWidget(icon: Icons.scale)),
          ),
        ],
      ),
    );
  }
}
