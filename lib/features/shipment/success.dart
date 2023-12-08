import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/route/keys.dart';
import 'package:movemate/core/utils/assets.dart';
import 'package:movemate/core/utils/colors.dart';
import 'package:movemate/core/widgets/button.dart';
import 'package:movemate/core/widgets/slide_fade.dart';
import 'package:movemate/features/shipment/widgets/counter.dart';

class ShipmentSuccessWidget extends StatefulWidget {
  const ShipmentSuccessWidget({super.key});

  @override
  State<ShipmentSuccessWidget> createState() => _ShipmentSuccessWidgetState();
}

class _ShipmentSuccessWidgetState extends State<ShipmentSuccessWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    AnimationController controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..forward();

    _scaleAnimation = Tween<double>(begin: .2, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideFadeWidget(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'MoveMate',
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: AppColors.purple[300],
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                5.horizontalSpace,
                Image.asset(AppAssets.logo,
                    width: 60.w, color: AppColors.yellow),
              ],
            ),
          ),
          60.verticalSpace,
          ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(AppAssets.package, width: 120.w)),
          60.verticalSpace,
          SlideFadeWidget(
            child: Column(
              children: [
                Text(
                  'Total Estimated Amount',
                  style: TextStyle(
                    fontSize: 26.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                10.verticalSpace,
                AnimatedCounterWidget(
                  beginValue: 800,
                  endValue: 1415,
                  prefix: '\$',
                  suffix: ' USD',
                  style: TextStyle(
                    fontSize: 26.sp,
                    color: AppColors.green,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                10.verticalSpace,
                Text(
                  'This amount is estimated; this will vary\nif you change your location or weight',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.37,
                    fontSize: 16.sp,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                40.verticalSpace,
                AppButton(
                    buttonText: 'Back to home',
                    onPressed: () => Navigator.of(context)
                        .pushNamedAndRemoveUntil(
                            RouteKeys.home, (route) => route.isFirst)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
