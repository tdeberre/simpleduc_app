import 'package:flutter/material.dart';

class Compta extends StatefulWidget {
  const Compta({super.key, required this.title});

  final String title;

  @override
  State<Compta> createState() => _ComptaState();
}

class _ComptaState extends State<Compta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("widget.title"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Compta")],
      )),
    );
  }
}
