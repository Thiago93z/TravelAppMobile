import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_mobile_app/views/main_places_page.dart';
import 'package:travel_mobile_app/views/menu_page.dart';
import 'package:travel_mobile_app/views/register_place_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List places = [];

  @override
  void initState() {
    super.initState();
    getPlaces();
  }

  Future getPlaces() async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    QuerySnapshot place = await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("places")
        .get();
    setState(() {
      if (place.docs.isNotEmpty) {
        for (var plac in place.docs) {
          places.add(plac.data());
          print("----------------------" + plac.data().toString());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TravelApp"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPlacesPage()));
              },
              icon: const Icon(Icons.nordic_walking_rounded,
                  size: 30, color: Colors.orangeAccent))
        ],
      ),
      drawer: MenuPage(),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (BuildContext context, i) {
          return ListTile(
            title: MiCardImage(
                places[i]["img"],
                places[i]["nombre"] +
                    "\n" +
                    places[i]["ciudad"] +
                    "\n" +
                    places[i]["departamento"] +
                    "\n" +
                    places[i]["descripcion"]),
            onTap: () {},
          );
        },
      ),
      /* Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Welcome: ${FirebaseAuth.instance.currentUser?.email}")
        ],
      )), */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RegisterPlacePage()));
        },
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.orangeAccent,
        ),
      ),
    );
  }
}

class MiCardImage extends StatelessWidget {
  final String url;
  final String texto;

  const MiCardImage(this.url, this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      margin: const EdgeInsets.all(20),
      elevation: 20,
      color: Colors.brown,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Column(
          children: [
            Image.network(
              url,
              width: MediaQuery.of(context).size.width,
              height: 250,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              color: Colors.lightBlueAccent,
              child: Text(
                texto,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
