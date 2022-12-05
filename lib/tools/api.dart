import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class Session {
  static String login = "";
  static String password = "";
  static String token = "";

  static Future<bool> connection(
      {required String login, required String password}) async {
    var rep = await post(
      Uri.parse(
          'http://s3-4433.nuage-peda.fr/simpleduc/public/api/authentication_token'),
      headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
        'Content-Type': 'application/json',
      },
      body:
          jsonEncode(<String, String>{'username': login, 'password': password}),
    );
    if (rep.statusCode == 200) {
      Session.login = login;
      Session.password = password;
      Session.token = jsonDecode(rep.body)['token'];
      return true;
    }
    return false;
  }

  static Map<String, dynamic> getprofile() {
    return {
      "nom": "jean",
      "prenom": "paul",
      "mail": "jean@paul",
      "roles": <String>["rh"],
    };
  }

  // var reponse = await get(
  //   Uri.parse('http://s3-4433.nuage-peda.fr/simpleduc/public/api'),
  //   headers: <String, String>{
  //     'Accept': 'application/json; charset=UTF-8',
  //     'Content-Type': 'application/json',
  //     'Authorization': "Bearer $token",
  //   },
  // );
  // if (reponse.statusCode == 200) {
  //   return jsonDecode(reponse.body);
  // } else {
  //   throw Exception("erreur de l'api");
  // }
}
