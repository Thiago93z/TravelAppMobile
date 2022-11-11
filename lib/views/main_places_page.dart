import 'package:accordion/accordion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_mobile_app/model/place_model.dart';
import 'package:travel_mobile_app/views/detail_page.dart';
import 'package:travel_mobile_app/views/menu_page.dart';
import 'home_page.dart';

class MainPlacesPage extends StatefulWidget {
  const MainPlacesPage({super.key});

  @override
  State<MainPlacesPage> createState() => _MainPlacesPageState();
}

class _MainPlacesPageState extends State<MainPlacesPage> {
  List mainPlaces = [];
  List idPlaces = [];
  final buscar = TextEditingController();

  @override
  void initState() {
    super.initState();
    getPlaces();
  }

  Future getPlaces() async {
    //String? uid = FirebaseAuth.instance.currentUser?.uid;
    QuerySnapshot place =
        await FirebaseFirestore.instance.collection("Places").get();
    setState(() {
      if (place.docs.isNotEmpty) {
        for (var plac in place.docs) {
          var id = plac.id;
          idPlaces.add(id);
          mainPlaces.add(plac.data());
          print("----------------------" + plac.data().toString());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TravelApp-MainPlaces"),
      ),
      drawer: MenuPage(),
      body: Stack(children: [
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                controller: buscar,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: "Fitrar busqueda",
                    hoverColor: Colors.green,
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.saved_search_rounded,
                      color: Colors.orangeAccent,
                    )),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.search_rounded)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: ListView.builder(
            itemCount: mainPlaces.length,
            itemBuilder: (BuildContext context, i) {
              return ListTile(
                title: MiCardImage(mainPlaces[i]["img"],
                    mainPlaces[i]["nombre"] /* + '\n' + idPlaces[i] */),
                onTap: () {
                  Place newPlace = Place(
                      idPlaces[i],
                      mainPlaces[i]["nombre"],
                      mainPlaces[i]["descripcion"],
                      mainPlaces[i]["ciudad"],
                      mainPlaces[i]["departamento"],
                      mainPlaces[i]["img"]);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPlace(newPlace)));
                },
              );
            },
          ),
        ),
      ]),
      /* Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Welcome: ${FirebaseAuth.instance.currentUser?.email}")
        ],
      )), */
    );
  }
}
