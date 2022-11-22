import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_mobile_app/model/place_model.dart';
import 'package:travel_mobile_app/model/places_local.dart';
import 'package:travel_mobile_app/views/detail_page.dart';
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
              return Center(
                child: ListTile(
                  selectedTileColor: Colors.yellow,
                  //subtitle: Text(mainPlaces[i]["ciudad"]),
                  subtitle: const Text(
                      "Press over the place for a few seconds to remove from your Favorites"),
                  title: MiCardImage(favoritePlaceList[i].img ?? "",
                      '${favoritePlaceList[i].nombre ?? ""}' /* ${"\n" "\n"}${favoritePlaceList[i].descripcion ?? ""} */),
                  tileColor: Colors.greenAccent,
                  onTap: () {
                    Place newPlace = Place(
                        favoritePlaceList[i].id,
                        favoritePlaceList[i].nombre,
                        favoritePlaceList[i].descripcion,
                        favoritePlaceList[i].ciudad,
                        favoritePlaceList[i].departamento,
                        favoritePlaceList[i].img);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPlace(newPlace)));
                  },
                  onLongPress: () {
                    setState(() {
                      favoritePlaceList[i].delete();
                    });
                  },
                ),
              );
            },
          );
        });
  }
}
