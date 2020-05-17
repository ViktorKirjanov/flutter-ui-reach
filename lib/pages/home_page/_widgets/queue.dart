import 'package:flutter/material.dart';
import 'package:login_and_dashboard/core/models/queue_item_model.dart';
import 'package:login_and_dashboard/pages/_widgets/ink_well_wrapper.dart';
import 'package:login_and_dashboard/pages/home_page/_widgets/queue_item_container.dart';
import 'package:login_and_dashboard/core/data/queue.dart';

class Queue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> queueItemlist = List<Widget>();
    queueList.forEach((QueueItem item) {
      queueItemlist.add(
        InkWellWrapper(child: QueueItemContainer(item: item)),
      );
      queueItemlist.add(SizedBox(height: 14.0));
    });

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Recent Queue',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(41, 34, 84, 1.0),
              ),
            ),
            Text(
              'View All',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(204, 61, 106, 1),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
        Column(
          children: queueItemlist,
        ),
      ],
    );
  }
}
