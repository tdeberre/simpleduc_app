import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

//permet de creer un session pour effectuer des requetes plus facilement
class Session {
  static String email = "";
  static String password = "";
  static String token = "";
  static Map<String, dynamic> profile = {};

  //il faut se connecter avant de pouvoir faire quoi que ce soit
  static Future<bool> connection(
      {required String email, required String password}) async {
    var rep = await post(
      Uri.parse(
          'http://s3-4433.nuage-peda.fr/simpleduc/public/api/authentication_token'),
      headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    if (rep.statusCode == 200) {
      Session.email = email;
      Session.password = password;
      Session.token = await jsonDecode(rep.body)['token'];
      print(token);
      Session.refresh();
      return true;
    }
    return false;
  }

  static refresh() async {
    Timer(
        const Duration(seconds: 3000),
        () => Session.connection(
            email: Session.email, password: Session.password));
  }

  static Future<bool> getProfile() async {
    var reponse = await get(
      Uri.parse('http://s3-4433.nuage-peda.fr/simpleduc/public/api/employes'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "bearer ${Session.token}",
      },
    );
    print(reponse.statusCode);
    if (reponse.statusCode == 200) {
      List listEmploye = await jsonDecode(reponse.body);
      for (var employe in listEmploye) {
        if (employe["email"] == Session.email) {
          Session.profile = employe;
          return true;
        }
      }
      throw Exception("employé introuvable");
    } else {
      throw Exception("erreur de connection");
    }
  }

  // return {
  //   "nom": "jean",
  //   "prenom": "paul",
  //   "mail": "jean@paul",
  //   "roles": <String>["rh"],
  // };
}
