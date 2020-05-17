import 'package:flutter/material.dart';

class InkWellWrapper extends StatelessWidget {
  final Widget child;

  const InkWellWrapper({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Widget _buildInkWellWrapper({@required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          highlightColor: Colors.transparent,
          splashColor: Color.fromRGBO(204, 61, 106, .1),
          onTap: () {
            print("tapped");
          },
          child: child,
        ),
      ),
    );
  }
}
