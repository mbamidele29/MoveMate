import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/utils/colors.dart';
import 'package:movemate/core/widgets/app_search.dart';
import 'package:movemate/core/widgets/appbar.dart';
import 'package:movemate/core/widgets/slide_fade.dart';
import 'package:movemate/features/dashboard/models/order.dart';
import 'package:movemate/features/dashboard/widgets/order_item.dart';

class SearchRootWidget extends StatefulWidget {
  const SearchRootWidget({super.key});

  @override
  State<SearchRootWidget> createState() => _SearchRootWidgetState();
}

class _SearchRootWidgetState extends State<SearchRootWidget> {
  late List<OrderModel> filteredOrders;

  @override
  void initState() {
    super.initState();
    filteredOrders = [...orders];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MoveMateAppBar(
        height:84.h,
        leadingWidth: 40.w,
        toolbarHeight: 80.h,
        color: AppColors.purple[300],
        titleWidget: Hero(
          tag: 'search_field',
          child: AppSearchTextField(
            autoFocus: true,
            onChanged: (val) {
              if (val == null || val.isEmpty) {
                filteredOrders = orders;
              } else {
                val = val.toLowerCase();

                filteredOrders = [...orders]
                    .where((element) =>
                        element.id.toLowerCase().contains(val!) ||
                        element.name.toLowerCase().contains(val) ||
                        element.from.toLowerCase().contains(val) ||
                        element.to.toLowerCase().contains(val))
                    .toList();
              }
              setState(() {});
            },
          ),
        ),
      ),
      body: SlideFadeWidget(
        child: Container(
          width: 375.w,
          constraints: BoxConstraints(maxHeight: 400.h),
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  itemBuilder: (_, index) =>
                      OrderItemWidget(order: filteredOrders[index]),
                  separatorBuilder: (_, index) =>
                      Divider(height: 0, color: AppColors.grey.withOpacity(.2)),
                  itemCount: filteredOrders.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
