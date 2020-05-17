import 'package:flutter/material.dart';
import 'package:login_and_dashboard/core/enums/queue_item_status_enum.dart';
import 'package:login_and_dashboard/core/models/queue_item_model.dart';
import 'package:login_and_dashboard/core/enums/queue_item_type_enum.dart';
import 'package:login_and_dashboard/core/helpers/style_helper.dart';

class QueueItemContainer extends StatelessWidget {
  final QueueItem item;

  const QueueItemContainer({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildQueueItemIcon(item.status),
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color.fromRGBO(41, 34, 84, 1.0),
                  ),
                ),
                SizedBox(height: 4.0),
                Row(
                  children: <Widget>[
                    Text(
                      item.type.toShortString(),
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(144, 141, 161, 1),
                      ),
                    ),
                    (item.date != null) ? _buildTextSeparator() : SizedBox(),
                    Text(
                      (item.date != null) ? item.date : '',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(144, 141, 161, 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: <Widget>[
                    Text(
                      item.status.toShortString(),
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: StyleHelper.statusColor(item.status),
                      ),
                    ),
                    _buildTextSeparator(),
                    Text(
                      '${item.progress} sent',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: StyleHelper.statusColor(item.status),
                      ),
                    ),
                    Text(
                      ' out of ${item.goal}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(86, 81, 115, 1.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQueueItemIcon(QueueItemStatus status) {
    if (status == QueueItemStatus.Completed)
      return Image.asset('assets/icons/queue_completed.png');
    else
      return Image.asset('assets/icons/queue_processing.png');
  }

  Widget _buildTextSeparator() {
    return Container(
      margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 1.0),
      width: 3.0,
      height: 3.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(224, 222, 234, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(3.0),
        ),
      ),
    );
  }
}
