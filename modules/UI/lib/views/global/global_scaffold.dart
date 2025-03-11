import 'package:flutter/material.dart';

class GlobalScaffold extends StatefulWidget {
  const GlobalScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<GlobalScaffold> createState() => _GlobalScaffoldState();
}

class _GlobalScaffoldState extends State<GlobalScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: widget.child,
    );
  }
}
