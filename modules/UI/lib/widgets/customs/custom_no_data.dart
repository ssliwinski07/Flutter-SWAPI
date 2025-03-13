import 'package:flutter/material.dart';

class CustomNoData extends StatelessWidget {
  const CustomNoData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No data'),
        SizedBox(
          height: 5,
        ),
        Icon(Icons.face_retouching_off_sharp)
      ],
    );
  }
}
