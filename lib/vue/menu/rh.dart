import 'package:flutter/material.dart';

class RH extends StatefulWidget {
  const RH({super.key, required this.title});

  final String title;

  @override
  State<RH> createState() => _RHState();
}

class _RHState extends State<RH> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("widget.title"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("rh")],
      )),
    );
  }
}
