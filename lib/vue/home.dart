import 'package:flutter/material.dart';
import 'package:simpleduc_app/tools/api.dart';

//menu principal
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            boutonsEnFonctionDuRole(context),
          ],
        ),
      ),
    );
  }
}

//renvoie une liste de bouton en fonction des fonctionalité disponible pour l'utilisateur
boutonsEnFonctionDuRole(BuildContext context) {
  List<String> roles = Session.profile["roles"];
  //le bouton profil est disponible pour tous
  List<Widget> list = [
    OutlinedButton(
        onPressed: () => Navigator.pushNamed(context, '/menu/profile'),
        child: const Text("profil")),
  ];
  //bouton si rh
  if (roles.contains("rh")) {
    list += [
      const Padding(padding: EdgeInsets.all(10)),
      OutlinedButton(
        onPressed: () => Navigator.pushNamed(context, '/menu/rh'),
        child: const Text("RH"),
      )
    ];
  }
  //bouton si compta
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
