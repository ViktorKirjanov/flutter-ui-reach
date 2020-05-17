import 'package:flutter/material.dart';
import 'package:login_and_dashboard/pages/_widgets/ink_well_wrapper.dart';
import 'package:login_and_dashboard/pages/home_page/_widgets/progress_item.dart';

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: InkWellWrapper(
            child: ProgressItem(
              image: Image.asset('assets/icons/completed.png'),
              title: 'Completed',
              count: 42,
            ),
          ),
        ),
        SizedBox(width: 16.0),
        Flexible(
          flex: 1,
          child: InkWellWrapper(
            child: ProgressItem(
              image: Image.asset('assets/icons/processing.png'),
              title: 'Processing',
              count: 12,
            ),
          ),
        ),
        SizedBox(width: 16.0),
        Flexible(
          flex: 1,
          child: InkWellWrapper(
            child: ProgressItem(
              image: Image.asset('assets/icons/failed.png'),
              title: 'Failed',
              count: 8,
            ),
          ),
        ),
      ],
    );
  }
}
