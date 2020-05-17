import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String valueKey;
  final String title;
  final Function action;
  final Color textColor;
  final Color backgroundColor;
  final bool borderSide;
  final double fontSize;
  final double letterSpacing;
  final FontWeight fontWeight;

  const ActionButton({
    this.valueKey,
    @required this.title,
    @required this.action,
    @required this.textColor,
    @required this.backgroundColor,
    this.borderSide = false,
    this.fontSize = 18.0,
    this.letterSpacing = 0.02,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.0,
      width: double.infinity,
      child: FlatButton(
        key: Key(valueKey),
        textColor: Colors.white,
        color: backgroundColor,
        highlightColor: textColor.withOpacity(0.16),
        splashColor: textColor.withOpacity(0.12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: borderSide
              ? BorderSide(
                  color: Colors.white,
                  width: 1,
                  style: BorderStyle.solid,
                )
              : BorderSide.none,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
        onPressed: () => action(),
      ),
    );
  }
}
