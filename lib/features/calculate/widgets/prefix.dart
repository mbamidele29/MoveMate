import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/utils/colors.dart';

class CalculatePrefixWidget extends StatelessWidget {
  final IconData icon;
  const CalculatePrefixWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10.h, 10.w, 10.h),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: AppColors.grey.withOpacity(.5)),
        ),
      ),
      child: Icon(
        icon,
        color: AppColors.primary.withOpacity(.6),
      ),
    );
  }
}
