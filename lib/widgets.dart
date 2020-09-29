import 'package:flutter/material.dart';

class ProductivityButton extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final VoidCallback onPressed;

  ProductivityButton(
      {@required this.color,
      @required this.text,
      @required this.size,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: this.color,
      child: Center(
        child: Text(
          this.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      onPressed: this.onPressed,
      //  minWidth: this.size,
    );
  }
}
