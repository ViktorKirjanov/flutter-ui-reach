import 'package:login_and_dashboard/core/enums/queue_item_status_enum.dart';
import 'package:login_and_dashboard/core/enums/queue_item_type_enum.dart';
import 'package:login_and_dashboard/core/models/queue_item_model.dart';

List<QueueItem> queueList = [
  QueueItem(
    title: 'Work from home promotion',
    type: QueueItemType.Campaign,
    date: 'April 12, 2020',
    status: QueueItemStatus.Processing,
    progress: 8,
    goal: 13,
  ),
  QueueItem(
    title: 'Group join confirmation',
    type: QueueItemType.Message,
    date: 'April 12, 2020',
    status: QueueItemStatus.Completed,
    progress: 12,
    goal: 12,
  ),
  QueueItem(
    title: 'Labor day campaign',
    type: QueueItemType.Campaign,
    date: null,
    status: QueueItemStatus.Processing,
    progress: 8,
    goal: 13,
  ),
];
