import 'package:flutter/material.dart';
import 'package:simpleduc_app/tools/api.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.title});

  final String title;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Container(
          child: profilePrinter(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/menu/profile/editer"),
        tooltip: "editer",
        child: Icon(Icons.edit),
      ),
    );
  }
}

profilePrinter(BuildContext context) {
  Map<String, dynamic> profileMap = Session.getprofile();
  List<Widget> listkey = List.empty(growable: true);
  List<Widget> listvalue = List.empty(growable: true);
  profileMap.forEach((key, value) {
    listkey += [
      Text("$key : "),
      const Padding(padding: EdgeInsets.all(10)),
    ];
    listvalue += [
      Text(value.toString()),
      const Padding(padding: EdgeInsets.all(10)),
    ];
  });
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listkey,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listvalue,
      ),
    ],
  );
}

class ProfileEditer extends StatefulWidget {
  const ProfileEditer({super.key, required this.title});

  final String title;

  @override
  State<ProfileEditer> createState() => _ProfileEditerState();
}

class _ProfileEditerState extends State<ProfileEditer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("ProfileEditer")],
      )),
    );
  }
}
