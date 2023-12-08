import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/utils/colors.dart';

class CalculateHeaderWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  const CalculateHeaderWidget({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
        if (subtitle != null)
          Text(
            subtitle ?? '',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
      ],
    );
  }
}
