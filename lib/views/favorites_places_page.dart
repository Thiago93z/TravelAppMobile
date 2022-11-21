import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_mobile_app/model/places_local.dart';
import 'package:travel_mobile_app/views/home_page.dart';

import '../repository/boxes.dart';
import 'menu_page.dart';

class FavoritesPlacesPage extends StatefulWidget {
  const FavoritesPlacesPage({super.key});

  @override
  State<FavoritesPlacesPage> createState() => _FavoritesPlacesPageState();
}

class _FavoritesPlacesPageState extends State<FavoritesPlacesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis Favoritos"),
      ),
      drawer: MenuPage(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: listaFavoritos(),
      ),
      bottomNavigationBar: const DownMenu(),
    );
  }

  Widget listaFavoritos() {
    return ValueListenableBuilder<Box<PlacesLocal>>(
        valueListenable: Boxes.boxFavoritos().listenable(),
        builder: (context, box, _) {
          final favoritePlaceList = box.values.toList().cast<PlacesLocal>();
          return ListView.builder(
            itemCount: favoritePlaceList.length,
            itemBuilder: (BuildContext context, i) {
              return ListTile(
                selectedTileColor: Colors.yellow,
                //subtitle: Text(mainPlaces[i]["ciudad"]),
                title: MiCardImage(favoritePlaceList[i].img ?? "",
                    '${favoritePlaceList[i].nombre ?? ""}${"\n" "\n"}${favoritePlaceList[i].descripcion ?? ""}'),
                tileColor: Colors.greenAccent,
                onTap: () {
                  /* Place newPlace = Place(
                      idPlaces[i],
                      mainPlaces[i]["nombre"],
                      mainPlaces[i]["descripcion"],
                      mainPlaces[i]["ciudad"],
                      mainPlaces[i]["departamento"],
                      mainPlaces[i]["img"]); */
                  /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPlace(newPlace))); */
                },
              );
            },
          );
        });
  }
}
