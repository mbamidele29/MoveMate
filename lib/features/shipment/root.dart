import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/utils/colors.dart';
import 'package:movemate/core/widgets/appbar.dart';
import 'package:movemate/core/widgets/slide_fade.dart';
import 'package:movemate/features/shipment/models/shipment.dart' as data;
import 'package:movemate/features/shipment/models/shipment.dart';
import 'package:movemate/features/shipment/utils/enums.dart';
import 'package:movemate/features/shipment/widgets/tab_bar_item.dart';
import 'package:movemate/features/shipment/widgets/tab_bar_view_item.dart';

class ShipmentRootWidget extends StatefulWidget {
  const ShipmentRootWidget({super.key});

  @override
  State<ShipmentRootWidget> createState() => _ShipmentRootWidgetState();
}

class _ShipmentRootWidgetState extends State<ShipmentRootWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late List<ShipmentModel> shipments;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    shipments = data.shipments;
    _tabController =
        TabController(length: ShipmentStatus.values.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });

    var controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this)
      ..forward();
    _slideAnimation = Tween<Offset>(
      end: const Offset(0, 0),
      begin: const Offset(.1, -.1),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MoveMateAppBar(
        height: 100.h,
        leadingWidth: 40.w,
        color: AppColors.purple[300],
        titleText: 'Shipment history',
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: SlideTransition(
            position: _slideAnimation,
            child: TabBar(
              isScrollable: true,
              indicatorWeight: 3,
              indicatorColor: AppColors.yellow,
              labelPadding:
                  EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                for (int i = 0; i < ShipmentStatus.values.length; i++)
                  TabBarItemWidget(
                      onTap: () {
                        _tabController.index = i;
                      },
                      isCurrent: i == _tabController.index,
                      count: shipments
                          .where((element) =>
                              ShipmentStatus.values[i] == ShipmentStatus.all ||
                              element.status == ShipmentStatus.values[i])
                          .length,
                      name: ShipmentStatus.values[i].name),
              ],
            ),
          ),
        ),
      ),
      body: SlideFadeWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Text(
                'Shipments',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Expanded(
                child: TabBarViewItemWidget(
                  shipments: shipments
                      .where((element) =>
                          ShipmentStatus.values[_tabController.index] ==
                              ShipmentStatus.all ||
                          element.status ==
                              ShipmentStatus.values[_tabController.index])
                      .toList(),
                ),
              ),
              // Expanded(
              // child: TabBarView(
              //   physics: const NeverScrollableScrollPhysics(),
              //   controller: _tabController,
              //   children: ShipmentStatus.values
              //       .map(
              //         (e) => TabBarViewItemWidget(
              //           shipments: shipments
              //               .where((element) =>
              //                   e == ShipmentStatus.all ||
              //                   element.status == e)
              //               .toList(),
              //         ),
              //       )
              //       .toList(),
              // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
