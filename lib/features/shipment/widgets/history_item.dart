import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movemate/core/utils/assets.dart';
import 'package:movemate/core/utils/colors.dart';
import 'package:movemate/features/shipment/models/shipment.dart';
import 'package:movemate/features/shipment/utils/enums.dart';

class ShipmentHistoryItemWidget extends StatelessWidget {
  final ShipmentModel shipment;
  const ShipmentHistoryItemWidget({super.key, required this.shipment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        shipment.status.icon,
                        color: shipment.status.color,
                      ),
                      Text(
                        shipment.status.name,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: shipment.status.color),
                      ),
                    ],
                  ),
                ),
                4.verticalSpace,
                Text(
                  'Arriving today!',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'Your delivery, #${shipment.id} from ${shipment.from}, is arriving today!',
                  style: TextStyle(
                    height: 1.27,
                    fontSize: 12.sp,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                6.verticalSpace,
                Row(
                  children: [
                    Text(
                      '\$${shipment.amount} USD',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.purple[300],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Icon(
                        Icons.circle,
                        size: 8.w,
                        color: AppColors.grey.withOpacity(.2),
                      ),
                    ),
                    Text(
                      DateFormat('MMM dd, y').format(DateTime.now()),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary.withOpacity(.7),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          30.horizontalSpace,
          Image.asset(AppAssets.package, width: 40.w)
        ],
      ),
    );
  }
}
