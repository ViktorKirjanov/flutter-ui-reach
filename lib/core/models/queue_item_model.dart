import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:login_and_dashboard/core/enums/queue_item_status_enum.dart';
import 'package:login_and_dashboard/core/enums/queue_item_type_enum.dart';

class QueueItem {
  final String title;
  final QueueItemType type;
  final String date;
  final QueueItemStatus status;
  final int progress;
  final int goal;

  QueueItem({
    @required this.title,
    @required this.type,
    @required this.date,
    @required this.status,
    @required this.progress,
    @required this.goal,
  });
}
