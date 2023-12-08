import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/utils/colors.dart';

class TrackingItemWidget extends StatelessWidget {
  final Widget? leading;
  final String title;
  final dynamic subtitle;
  const TrackingItemWidget(
      {super.key, this.leading, required this.title, required this.subtitle})
      : assert(subtitle is Widget || subtitle is String);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading ?? const SizedBox.shrink(),
        Visibility(visible: leading != null, child: 10.horizontalSpace),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              4.verticalSpace,
              if (subtitle is Widget)
                subtitle
              else
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
