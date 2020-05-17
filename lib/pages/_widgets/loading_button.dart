import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  final String valueKey;
  final Color textColor;
  final Color backgroundColor;
  final bool borderSide;

  const LoadingButton({
    this.valueKey,
    @required this.textColor,
    @required this.backgroundColor,
    this.borderSide = false,
  });

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.0,
      width: double.infinity,
      child: FlatButton(
        key: Key(widget.valueKey),
        textColor: Colors.white,
        color: widget.backgroundColor,
        highlightColor: widget.textColor.withOpacity(0.16),
        splashColor: widget.textColor.withOpacity(0.12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: widget.borderSide
              ? BorderSide(
                  color: Colors.white,
                  width: 1,
                  style: BorderStyle.solid,
                )
              : BorderSide.none,
        ),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(widget.textColor),
        ),
        onPressed: () => null,
      ),
    );
  }
}
