import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movemate/core/utils/assets.dart';
import 'package:movemate/core/utils/colors.dart';
import 'package:movemate/core/widgets/bounce_widget.dart';
import 'package:movemate/features/dashboard/widgets/tracking_item.dart';

class TrackingWidget extends StatelessWidget {
  const TrackingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tracking',
            style: TextStyle(
              height: 1,
              fontSize: 16.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          10.verticalSpace,
          Container(
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
                  15.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        const Expanded(
                          child: TrackingItemWidget(
                              title: 'Shipment Number',
                              subtitle: 'NEJ20089934122231'),
                        ),
                        Image.asset(AppAssets.courier, width: 50.w),
                      ],
                    ),
                  ),
                  Divider(
                    indent: 16.w,
                    height: 30.h,
                    endIndent: 16.w,
                    color: AppColors.grey.withOpacity(.2),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TrackingItemWidget(
                            leading: CircleAvatar(
                              radius: 15.w,
                              backgroundColor: AppColors.yellow.withOpacity(.2),
                              child: SvgPicture.asset(AppAssets.outgoingPackage,
                                  width: 20.w),
                            ),
                            title: 'Sender',
                            subtitle: 'Atlanta, 5243',
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: TrackingItemWidget(
                            title: 'Time',
                            subtitle: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 6.w,
                                  color: AppColors.green,
                                ),
                                3.horizontalSpace,
                                Text(
                                  '2 day - 3 days',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  25.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: TrackingItemWidget(
                                leading: CircleAvatar(
                                  radius: 15.w,
                                  backgroundColor:
                                      AppColors.green.withOpacity(.2),
                                  child: SvgPicture.asset(
                                      AppAssets.incomingPackage,
                                      width: 20.w),
                                ),
                                title: 'Receiver',
                                subtitle: 'Chicago, 6342')),
                        const Expanded(
                            flex: 2,
                            child: TrackingItemWidget(
                                title: 'Status',
                                subtitle: 'Waiting to collect')),
                      ],
                    ),
                  ),
                  15.verticalSpace,
                  Divider(
                    height: 0,
                    color: AppColors.grey.withOpacity(.2),
                  ),
                  Center(
                    child: BounceWidget(
                      onPressed: () {},
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.add_rounded,
                              color: AppColors.yellow),
                          label: Text(
                            'Add Stop',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.yellow,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
