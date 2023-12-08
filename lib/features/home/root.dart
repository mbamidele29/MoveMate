import 'package:flutter/material.dart';
import 'package:movemate/features/dashboard/root.dart';
import 'package:movemate/features/home/utils/enums.dart';
import 'package:movemate/features/home/widgets/bottom_nav.dart';
import 'package:movemate/features/profile/root.dart';

class HomeRootWidget extends StatefulWidget {
  const HomeRootWidget({super.key});

  @override
  State<HomeRootWidget> createState() => _HomeRootWidgetState();
}

class _HomeRootWidgetState extends State<HomeRootWidget> {
  BottomNavigationItems current = BottomNavigationItems.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: current.index,
        children: const [
          DashboardRootWidget(),
          SizedBox.shrink(),
          SizedBox.shrink(),
          ProfileRootWidget()
        ],
      ),
      bottomNavigationBar: BottomNavigationWidget(
        onTapChanged: (val) {
          current = val;
          setState(() {});
        },
      ),
    );
  }
}
