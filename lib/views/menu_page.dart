import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_mobile_app/views/home_page.dart';
import 'package:travel_mobile_app/views/login_page.dart';
import 'package:travel_mobile_app/views/main_places_page.dart';
import 'package:travel_mobile_app/views/place_view.dart';
import 'package:travel_mobile_app/views/places.list.dart';

class MenuPage extends StatelessWidget {
  late Places dataPlace;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(color: Colors.green),
              child: Image.asset("assets/img/userImg.png")),
          Column(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.person_pin_circle_rounded,
                  size: 20,
                  color: Colors.blue,
                ),
                title:
                    Text((FirebaseAuth.instance.currentUser?.email).toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        )),
                textColor: Colors.blueAccent,
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                iconColor: Colors.red,
                title: const Text('Inicio', style: TextStyle(fontSize: 15)),
                leading: const Icon(Icons.home),
                textColor: Colors.red,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
              ),
              const SizedBox(
                height: 3,
              ),
              ListTile(
                iconColor: Colors.red,
                title: const Text('Lugares', style: TextStyle(fontSize: 15)),
                leading: const Icon(Icons.place),
                textColor: Colors.red,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainPlacesPage()));
                },
              ),
              const SizedBox(
                height: 3,
              ),
              ListTile(
                iconColor: Colors.red,
                title: const Text('Favoritos', style: TextStyle(fontSize: 15)),
                leading: const Icon(Icons.star),
                textColor: Colors.red,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Places()));
                },
              ),
              const SizedBox(
                height: 3,
              ),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app_rounded,
                  size: 20,
                  color: Colors.blue,
                ),
                title: const Text(
                  "Salir",
                  style: TextStyle(fontSize: 20),
                ),
                textColor: Colors.black87,
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
