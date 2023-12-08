import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/utils/assets.dart';
import 'package:movemate/core/utils/colors.dart';
import 'package:movemate/core/widgets/slide_fade.dart';
import 'package:movemate/features/dashboard/models/order.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderModel order;
  const OrderItemWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return SlideFadeWidget(
      resetAnimation: true,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Row(
          children: [
            CircleAvatar(
              radius: 15.w,
              backgroundColor: AppColors.purple[300],
              child: Image.asset(AppAssets.package, width: 16.w),
            ),
            10.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                4.verticalSpace,
                Row(
                  children: [
                    Text(
                      '#${order.id}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Icon(
                        Icons.circle,
                        size: 6.w,
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      order.from,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        size: 12.w,
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      order.to,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
