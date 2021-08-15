import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    required this.text,
    required this.onPressed,
    required this.padding,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.textcolor,
  });

  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final Color textcolor;

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(widget.text),
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
          primary: widget.color,
          onPrimary: widget.textcolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: widget.padding,
          side: BorderSide.none,
          shadowColor: Colors.deepPurple,
          elevation: 1,
          textStyle: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
          )),
    );
  }
}
