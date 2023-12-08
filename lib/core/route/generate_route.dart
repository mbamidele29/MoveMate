import 'package:flutter/material.dart';
import 'package:movemate/core/route/fade_route.dart';
import 'package:movemate/core/route/keys.dart';
import 'package:movemate/features/calculate/root.dart';
import 'package:movemate/features/dashboard/search.dart';
import 'package:movemate/features/home/root.dart';
import 'package:movemate/features/shipment/root.dart';
import 'package:movemate/features/shipment/success.dart';

Route generateRoute(RouteSettings settings) {
  String name = settings.name ?? '';

  switch (name) {
    case RouteKeys.home:
      return FadeRoute(page: const HomeRootWidget());
    case RouteKeys.search:
      return FadeRoute(page: const SearchRootWidget());
    case RouteKeys.shipment:
      return FadeRoute(page: const ShipmentRootWidget());
    case RouteKeys.calculate:
      return FadeRoute(page: const CalculateRootWidget());
    case RouteKeys.shipmentSuccess:
      return FadeRoute(page: const ShipmentSuccessWidget());
    default:
      return FadeRoute(page: const Text(''));
  }
}
