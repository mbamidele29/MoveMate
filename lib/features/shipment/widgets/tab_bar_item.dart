import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/utils/colors.dart';
import 'package:movemate/core/widgets/bounce_widget.dart';

class TabBarItemWidget extends StatelessWidget {
  final int count;
  final String name;
  final bool isCurrent;
  final VoidCallback onTap;
  const TabBarItemWidget(
      {super.key,
      required this.name,
      required this.count,
      required this.onTap,
      required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    return BounceWidget(
      onPressed: onTap,
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          4.horizontalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color:
                  isCurrent ? AppColors.yellow : Colors.white.withOpacity(.2),
            ),
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
