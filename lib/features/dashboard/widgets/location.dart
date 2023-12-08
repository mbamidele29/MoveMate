import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.white.withOpacity(.8),
              size: 16.w,
            ),
            4.horizontalSpace,
            Text(
              'Your location',
              style: TextStyle(
                height: 1,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(.8),
              ),
            ),
          ],
        ),
        6.verticalSpace,
        Row(
          children: [
            Text(
              'Ikeja, Lagos',
              style: TextStyle(
                height: 1,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(.8),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white.withOpacity(.8),
            )
          ],
        ),
      ],
    );
  }
}
