import 'package:flutter/material.dart';
import 'package:movemate/core/utils/colors.dart';

enum ShipmentStatus { all, completed, inProgress, pending, cancelled }

extension ShipmentStatusExt on ShipmentStatus {
  String get name {
    switch (this) {
      case ShipmentStatus.all:
        return 'All';
      case ShipmentStatus.completed:
        return 'Completed';
      case ShipmentStatus.inProgress:
        return 'In progress';
      case ShipmentStatus.pending:
        return 'Pending';
      case ShipmentStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get color {
    switch (this) {
      case ShipmentStatus.all:
        return Colors.transparent;
      case ShipmentStatus.completed:
      case ShipmentStatus.inProgress:
        return AppColors.green;
      case ShipmentStatus.pending:
        return AppColors.yellow;
      case ShipmentStatus.cancelled:
        return Colors.red[400]!;
    }
  }

  IconData get icon {
    switch (this) {
      case ShipmentStatus.all:
      case ShipmentStatus.completed:
        return Icons.check;
      case ShipmentStatus.inProgress:
      case ShipmentStatus.pending:
        return Icons.av_timer_outlined;
      case ShipmentStatus.cancelled:
        return Icons.close_rounded;
    }
  }
}
