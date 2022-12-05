import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simpleduc_app/tools/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
          child: FutureBuilder(
        future: test(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [boutonsEnFonctionDuRole(context)])
              : const Text("chargement");
        },
      )),
    );
  }
}

Future<Text> test() async {
  await Future.delayed(const Duration(seconds: 3));
  return const Text("data");
}

boutonsEnFonctionDuRole(BuildContext context) {
  List<String> roles = Session.getprofile()["roles"];
  List<Widget> list = [
    OutlinedButton(
        onPressed: () => Navigator.pushNamed(context, '/menu/profile'),
        child: const Text("profil")),
  ];
  if (roles.contains("rh")) {
    list += [
      const Padding(padding: EdgeInsets.all(10)),
      OutlinedButton(
        onPressed: () => Navigator.pushNamed(context, '/menu/rh'),
        child: const Text("RH"),
      )
    ];
  }
  if (roles.contains("compta")) {
    list += [
      const Padding(padding: EdgeInsets.all(10)),
      OutlinedButton(
        onPressed: () => Navigator.pushNamed(context, "/menu/compta"),
        child: const Text("compta"),
      ),
    ];
  }
  return Center(
    child: Column(children: list),
  );
}
