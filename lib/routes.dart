import 'package:flutter/material.dart';
export 'package:simpleduc_app/vue/splash.dart';

//import des menus
import 'package:simpleduc_app/vue/login.dart';
import 'package:simpleduc_app/vue/home.dart';
import 'package:simpleduc_app/vue/menu/profile.dart';
import 'package:simpleduc_app/vue/menu/rh.dart';
import "package:simpleduc_app/vue/menu/compta.dart";

//map contenant les routes
Map<String, WidgetBuilder> mesRoutes() => {
      '/login': (BuildContext context) => const LoginPage(title: "Connection"),
      '/home': (BuildContext context) =>
          const HomePage(title: "Menu principal"),
      '/menu/profile': (BuildContext context) =>
          const Profile(title: "Votre profil"),
      '/menu/profile/editer': (BuildContext context) =>
          const ProfileEditer(title: "Modifiez votre profil"),
      '/menu/rh': (BuildContext context) =>
          const RH(title: "Menu Ressources Humaines"),
      '/menu/compta': (BuildContext context) =>
          const Compta(title: "Menu Comptabilité"),
    };
