import 'package:flutter/material.dart';

enum BottomNavigationItems { home, calculate, shipment, profile }

extension BottomNavigationItemsExt on BottomNavigationItems {
  String get name {
    switch (this) {
      case BottomNavigationItems.home:
        return 'Home';
      case BottomNavigationItems.calculate:
        return 'Calculate';
      case BottomNavigationItems.shipment:
        return 'Shipment';
      case BottomNavigationItems.profile:
        return 'Profile';
    }
  }

  IconData get icon {
    switch (this) {
      case BottomNavigationItems.home:
        return Icons.home_outlined;
      case BottomNavigationItems.calculate:
        return Icons.calculate_outlined;
      case BottomNavigationItems.shipment:
        return Icons.replay_10_rounded;
      case BottomNavigationItems.profile:
        return Icons.person_2_outlined;
    }
  }
}
