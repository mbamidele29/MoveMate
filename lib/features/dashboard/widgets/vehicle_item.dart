import 'package:flutter/material.dart';
import 'package:movemate/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/features/dashboard/models/vehicle.dart';

class AvailableItemWidget extends StatefulWidget {
  final VehicleModel vehicle;
  final AnimationController animationController;

  const AvailableItemWidget(
      {super.key, required this.vehicle, required this.animationController});

  @override
  State<AvailableItemWidget> createState() => _AvailableItemWidgetState();
}

class _AvailableItemWidgetState extends State<AvailableItemWidget> {
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    _slideAnimation = Tween<Offset>(
      end: const Offset(0, 0),
      begin: const Offset(.5, -.2),
    ).animate(CurvedAnimation(
        parent: widget.animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 180.h,
      padding: EdgeInsets.fromLTRB(10.w, 10.h, 0, 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -10,
            right: -80,
            child: SlideTransition(
                position: _slideAnimation,
                child: Image.asset(widget.vehicle.image, width: 200.w)),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.vehicle.title,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w400,
                ),
              ),
              4.verticalSpace,
              Text(
                widget.vehicle.subtitle,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
