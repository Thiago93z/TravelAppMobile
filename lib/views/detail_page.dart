import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_mobile_app/model/place_model.dart';
import 'package:travel_mobile_app/model/places_local.dart';
import 'package:travel_mobile_app/repository/boxes.dart';
import 'package:travel_mobile_app/views/home_page.dart';

import 'menu_page.dart';

class DetailPlace extends StatefulWidget {
  final Place dataPlace;
  const DetailPlace(this.dataPlace, {super.key});

  @override
  State<DetailPlace> createState() => _DetailPlaceState();
}

class _DetailPlaceState extends State<DetailPlace> {
  List hoteles = [];

  void addFavorites() {
    var favoritePlace = PlacesLocal()
      ..id = widget.dataPlace.id
      ..nombre = widget.dataPlace.nombre
      ..ciudad = widget.dataPlace.ciudad
      ..departamento = widget.dataPlace.departamento
      ..descripcion = widget.dataPlace.descripcion
      ..img = widget.dataPlace.img;

    final box = Boxes.boxFavoritos();
    box.add(favoritePlace);
  }

  @override
  void initState() {
    super.initState();
    getPlaces();
  }

  Future getPlaces() async {
    String? uid = FirebaseFirestore.instance.collection("places").id;
    //QuerySnapshot mascota= await FirebaseFirestore.instance.collection("Usuarios").doc(uid).collection("mascotas").where("nombre", isEqualTo: "Paquito").get()
    QuerySnapshot hotel = await FirebaseFirestore.instance
        .collection("places")
        .doc(uid)
        .collection("hoteles")
        .get();
    setState(() {
      if (hotel.docs.isNotEmpty) {
        for (var plac in hotel.docs) {
          hoteles.add(plac.data());
          print("----------------------" + plac.data().toString());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dataPlace.nombre),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 25),
              onPressed: () {
                addFavorites();
              },
              icon: const Icon(
                FontAwesomeIcons.heart,
                size: 30,
                color: Colors.white54,
              ))
        ],
      ),
      body: ListView(children: [
        Center(
          child: MiCardImage(
              widget.dataPlace.img,
              widget.dataPlace.ciudad +
                  " - " +
                  widget.dataPlace.departamento +
                  "\n" +
                  "\n" +
                  widget.dataPlace.descripcion +
                  "\n" +
                  "\n" +
                  widget.dataPlace.descripcion),
        ),
        Center(
            child: RichText(
          text:
              const TextSpan(text: 'Conoces este lugar? Dale una puntuacion!'),
          selectionRegistrar: SelectionContainer.maybeOf(context),
          selectionColor: const Color(0xAF6694e8),
        )),
        Center(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 50, top: 20),
          child: RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        ))
      ]),
      bottomNavigationBar: const DownMenu(),
    );
  }
}
