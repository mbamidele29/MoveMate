import 'package:flutter/material.dart';
import 'package:movemate/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/features/dashboard/models/vehicle.dart';
import 'package:movemate/features/dashboard/widgets/vehicle_item.dart';

class AvailableVehiclesWidget extends StatefulWidget {
  final AnimationController animationController;
  const AvailableVehiclesWidget({super.key, required this.animationController});

  @override
  State<AvailableVehiclesWidget> createState() =>
      _AvailableVehiclesWidgetState();
}

class _AvailableVehiclesWidgetState extends State<AvailableVehiclesWidget> {
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    _slideAnimation = Tween<Offset>(
      end: const Offset(0, 0),
      begin: const Offset(.2, .2),
    ).animate(CurvedAnimation(
        parent: widget.animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Available vehicles',
            style: TextStyle(
              height: 1,
              fontSize: 16.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        10.verticalSpace,
        SlideTransition(
          position: _slideAnimation,
          child: SizedBox(
            height: 180.h,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemBuilder: (_, index) => AvailableItemWidget(
                  vehicle: vehicles[index],
                  animationController: widget.animationController),
              separatorBuilder: (_, index) => 20.horizontalSpace,
              itemCount: vehicles.length,
            ),
          ),
        )
      ],
    );
  }
}
