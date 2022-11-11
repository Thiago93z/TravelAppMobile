import 'package:flutter/material.dart';
import 'package:travel_mobile_app/views/home_page.dart';
import 'package:travel_mobile_app/views/login_page.dart';
import 'package:travel_mobile_app/views/places.list.dart';

Widget mainMenu(BuildContext context) {
  return Drawer(
    shape: const RoundedRectangleBorder(),
    child: ListView(
      padding: const EdgeInsets.all(0),
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(children: const [
            Text('Travel App',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 20)),
            Text('',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 20)),
          ]),
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Places()));
          },
        ),
        const SizedBox(
          height: 3,
        ),
        const ListTile(
          iconColor: Colors.red,
          title: Text('Favoritos', style: TextStyle(fontSize: 15)),
          leading: Icon(Icons.star),
          textColor: Colors.red,
          /* onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Favorites()));
          }, */
        ),
        const SizedBox(
          height: 3,
        ),
        ListTile(
          iconColor: Colors.red,
          title: const Text('Cerrar Sesión', style: TextStyle(fontSize: 15)),
          leading: const Icon(Icons.logout_outlined),
          textColor: Colors.red,
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false);
          },
        ),
        const SizedBox(
          height: 3,
        ),
      ],
    ),
  );
}
