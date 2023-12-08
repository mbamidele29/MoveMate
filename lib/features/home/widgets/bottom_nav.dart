import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/route/keys.dart';
import 'package:movemate/core/utils/colors.dart';
import 'package:movemate/core/widgets/bounce_widget.dart';
import 'package:movemate/features/home/utils/enums.dart';

class BottomNavigationWidget extends StatefulWidget {
  final ValueChanged<BottomNavigationItems> onTapChanged;
  const BottomNavigationWidget({super.key, required this.onTapChanged});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final double width = 375.w;
  late double indicatorWidth;
  BottomNavigationItems current = BottomNavigationItems.home;

  @override
  void initState() {
    indicatorWidth = width / BottomNavigationItems.values.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 80.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 7,
            offset: const Offset(0, 0),
            color: Colors.black.withOpacity(.05),
          ),
        ],
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: current.index * indicatorWidth,
            child: Container(
              height: 5.h,
              width: indicatorWidth,
              color: AppColors.purple[300],
            ),
          ),
          Row(
              children: BottomNavigationItems.values
                  .map(
                    (e) => Expanded(
                      child: BounceWidget(
                        onPressed: () {
                          if (e == BottomNavigationItems.calculate) {
                            Navigator.of(context).pushNamed(RouteKeys.calculate);
                            return;
                          }
                          if (e == BottomNavigationItems.shipment) {
                            Navigator.of(context).pushNamed(RouteKeys.shipment);
                            return;
                          }
                          current = e;
                          widget.onTapChanged(current);
                          setState(() {});
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              e.icon,
                              size: 25.w,
                              color: e == current
                                  ? AppColors.purple[300]
                                  : AppColors.grey,
                            ),
                            Text(
                              e.name,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: e == current
                                    ? AppColors.purple[300]
                                    : AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList()),
        ],
      ),
    );
  }
}
