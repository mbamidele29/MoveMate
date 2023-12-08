import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/route/keys.dart';
import 'package:movemate/core/utils/assets.dart';
import 'package:movemate/core/utils/colors.dart';
import 'package:movemate/core/widgets/app_search.dart';
import 'package:movemate/core/widgets/appbar.dart';
import 'package:movemate/core/widgets/slide_fade.dart';
import 'package:movemate/features/dashboard/widgets/location.dart';
import 'package:movemate/features/dashboard/widgets/tracking.dart';
import 'package:movemate/features/dashboard/widgets/vehicles.dart';

class DashboardRootWidget extends StatefulWidget {
  const DashboardRootWidget({super.key});

  @override
  State<DashboardRootWidget> createState() => _DashboardRootWidgetState();
}

class _DashboardRootWidgetState extends State<DashboardRootWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _appbarSlideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this)
      ..forward();
    _appbarSlideAnimation = Tween<Offset>(
      end: const Offset(0, 0),
      begin: const Offset(0, -1),
    ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(145.h),
        child: SlideTransition(
          position: _appbarSlideAnimation,
          child: MoveMateAppBar(
            height: 160.h,
            leadingWidth: 60.w,
            toolbarHeight: 55.h,
            color: AppColors.purple[300],
            lead: Padding(
              padding: EdgeInsets.only(top: 10.h, left: 16.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.w),
                child: Image.asset(
                  AppAssets.profile,
                  width: 40.w,
                  height: 40.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            action: Padding(
              padding: EdgeInsets.only(top: 10.h, right: 16.w),
              child: CircleAvatar(
                radius: 20.w,
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.black,
                ),
              ),
            ),
            titleWidget: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: const LocationWidget(),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
                child: Hero(
                  tag: 'search_field',
                  child: AppSearchTextField(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteKeys.search);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SlideFadeWidget(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TrackingWidget(),
              20.verticalSpace,
              AvailableVehiclesWidget(animationController: _controller)
            ],
          ),
        ),
      ),
    );
  }
}
