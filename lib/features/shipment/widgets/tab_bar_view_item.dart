import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/widgets/slide_fade.dart';
import 'package:movemate/features/shipment/models/shipment.dart';
import 'package:movemate/features/shipment/widgets/history_item.dart';

class TabBarViewItemWidget extends StatefulWidget {
  final List<ShipmentModel> shipments;
  const TabBarViewItemWidget({super.key, required this.shipments});

  @override
  State<TabBarViewItemWidget> createState() => _TabBarViewItemWidgetState();
}

class _TabBarViewItemWidgetState extends State<TabBarViewItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      itemBuilder: (_, index) => SlideFadeWidget(
          resetAnimation: true,
          child: ShipmentHistoryItemWidget(shipment: widget.shipments[index])),
      separatorBuilder: (_, index) => 20.verticalSpace,
      itemCount: widget.shipments.length,
    );
  }
}
