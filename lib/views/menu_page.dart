import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_mobile_app/views/favorites_places_page.dart';
import 'package:travel_mobile_app/views/home_page.dart';
import 'package:travel_mobile_app/views/login_page.dart';
import 'package:travel_mobile_app/views/main_places_page.dart';
import 'package:travel_mobile_app/views/places.list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  String? uid = FirebaseAuth.instance.currentUser?.uid;
  @override
  Widget build(
    BuildContext context,
  ) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Name, email address, and profile photo URL
      final name = user.displayName;
      final email = user.email;
      final photoUrl = user.photoURL;

      // Check if user's email is verified
      final emailVerified = user.emailVerified;

      // The user's ID, unique to the Firebase project. Do NOT use this value to
      // authenticate with your backend server, if you have one. Use
      // User.getIdToken() instead.
      final uid = user.uid;
    }
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
                title: Text("${user?.email}",
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
                          builder: (context) => const MainPlacesPage()));
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
                          builder: (context) => const MainPlacesPage()));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoritesPlacesPage()));
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

class DownMenu extends StatelessWidget {
  const DownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.tree, size: 30), label: "Places"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.mountainSun, size: 30),
              label: "Favorites"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.monument, size: 30),
              label: "Hoteles"),
        ],
        onTap: (indice) {
          if (indice == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          } else if (indice == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MainPlacesPage()));
          } else if (indice == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoritesPlacesPage()));
          }
        });
  }
}
