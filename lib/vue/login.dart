import 'package:flutter/material.dart';
import 'package:simpleduc_app/tools/api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String login = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "Login"),
                  validator: (valeur) {
                    if (valeur == null || valeur.isEmpty) {
                      return 'Veuillez entrer votre login';
                    } else {
                      login = valeur.toString();
                    }
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Mot de passe"),
                  validator: (valeur) {
                    if (valeur == null || valeur.isEmpty) {
                      return 'Veuillez entrer votre mot de passe';
                    } else {
                      password = valeur.toString();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      nonsens(context, login, password);
                    }
                  },
                  child: const Text("Se connecter"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void nonsens(BuildContext context, String login, String password) async {
  if (true
      //await Session.connection(login: login, password: password)
      ) {
    Navigator.pushReplacementNamed(context, '/home');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Echec de la connexion'),
    ));
  }
}
