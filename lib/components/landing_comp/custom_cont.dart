import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final String text;
  final double textSize;
  final double height;
  final double width;
  final BuildContext context;
  final Color c1;
  const CustomContainer({Key? key, required this.text, required this.context, required this.textSize, required this.height, required this.width, required this.c1}) : super(key: key);

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.c1,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(fontSize: widget.textSize),
        ),
      ),
    );
  }
}
