import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }
}
