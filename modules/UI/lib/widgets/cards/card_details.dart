import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({
    super.key,
    required this.child,
    this.width,
    this.height,
  });

  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
