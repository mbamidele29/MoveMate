import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/utils/colors.dart';

class ProfileRootWidget extends StatelessWidget {
  const ProfileRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Profile',
          style: TextStyle(
              fontSize: 20.sp,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w800,
              color: AppColors.purple[300]),
        ),
      ),
    );
  }
}
