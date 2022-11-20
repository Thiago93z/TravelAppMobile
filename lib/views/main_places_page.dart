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

  Future getPlacesbyCity() async {
    //String? uid = FirebaseAuth.instance.currentUser?.uid;
    idPlaces.clear();
    mainPlaces.clear();
    QuerySnapshot placebyCity = await FirebaseFirestore.instance
        .collection("Places")
        .where("ciudad", isEqualTo: buscar.text)
        .get();
    setState(() {
      if (placebyCity.docs.isNotEmpty) {
        for (var plac in placebyCity.docs) {
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
        Row(children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                top: 20,
                left: 50,
                right: 0,
              ),
              child: TextFormField(
                controller: buscar,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Fitrar por ciudad",
                  hoverColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  getPlacesbyCity();
                });
              },
              padding: const EdgeInsets.only(right: 50, left: 10),
              icon: const Icon(
                Icons.search_rounded,
                size: 50,
                color: Colors.green,
              )),
        ]),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 90),
          child: ListView.builder(
            itemCount: mainPlaces.length,
            itemBuilder: (BuildContext context, i) {
              return ListTile(
                selectedTileColor: Colors.yellow,
                //subtitle: Text(mainPlaces[i]["ciudad"]),
                title: MiCardImage(
                    mainPlaces[i]["img"],
                    mainPlaces[i]["nombre"] +
                        '\n' +
                        mainPlaces[i]["ciudad"] /* + '\n' + idPlaces[i] */),
                tileColor: Colors.greenAccent,
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
      bottomNavigationBar: const DownMenu(),
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
