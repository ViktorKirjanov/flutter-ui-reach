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

  // static Color activityChangeColor(
  //     String operationType, String operationValue) {
  //   if (['Payout', 'Bonus', 'Withdrawal'].contains(operationType)) {
  //     String operand = operationValue.substring(0, 1);
  //     switch (operand) {
  //       case '-':
  //         return AppColors.red;
  //         break;
  //       case '+':
  //         return AppColors.green;
  //         break;
  //       default:
  //         return AppColors.defaultTextColor;
  //     }
  //   }
  //   return null;
  // }

  // static LinearGradient activityGradient(String status) {
  //   switch (status) {
  //     case 'ok':
  //     case 'active':
  //     case 'activated':
  //       return LinearGradient(
  //         begin: Alignment.centerRight,
  //         end: Alignment.centerLeft,
  //         colors: [AppColors.listActiveGradient, Colors.white],
  //       );
  //       break;
  //     case 'pending':
  //     case 'processing':
  //       return LinearGradient(
  //         begin: Alignment.centerRight,
  //         end: Alignment.centerLeft,
  //         colors: [AppColors.listPendingGradient, Colors.white],
  //       );
  //       break;
  //     case 'fail':
  //       return LinearGradient(
  //         begin: Alignment.centerRight,
  //         end: Alignment.centerLeft,
  //         colors: [AppColors.listFailGradient, Colors.white],
  //       );
  //       break;
  //     case 'none':
  //     default:
  //       return null;
  //   }
  // }

  // static Widget activityIndicator(String status) {
  //   switch (status) {
  //     case 'ok':
  //     case 'active':
  //     case 'activated':
  //       return Image.asset('assets/icons/active.png');
  //       break;
  //     case 'pending':
  //     case 'processing':
  //       return Image.asset('assets/icons/pending.png');
  //       break;
  //     case 'fail':
  //       return Image.asset('assets/icons/fail.png');
  //       break;
  //     case 'none':
  //     default:
  //       return Container();
  //   }
  // }
}
