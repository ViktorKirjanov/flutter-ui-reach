import 'package:flutter/material.dart';
import 'package:login_and_dashboard/core/enums/queue_item_status_enum.dart';
import 'package:login_and_dashboard/colors.dart' as AppColors;

class StyleHelper {
  static Color statusColor(QueueItemStatus status) {
    switch (status) {
      case QueueItemStatus.Processing:
        return AppColors.processing;
        break;
      case QueueItemStatus.Completed:
        return AppColors.completed;
        break;
      default:
        return AppColors.defaultTextColor;
    }
  }
}
