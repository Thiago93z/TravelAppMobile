import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:travel_mobile_app/model/place_model.dart';
import 'package:travel_mobile_app/views/main_menu.dart';
import 'package:travel_mobile_app/views/menu_page.dart';

// ignore: must_be_immutable
class PlaceView extends StatefulWidget {
  final Place dataPlace;
  const PlaceView({super.key, required this.dataPlace});

  @override
  State<PlaceView> createState() => _PlaceViewState();
}

class _PlaceViewState extends State<PlaceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: placeBody(),
      drawer: MenuPage(),
    );
  }

  myAppbar() {
    return AppBar(
      backgroundColor: Colors.red,
      centerTitle: true,
      title: const Text(
        'Sitio Turístico',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  placeBody() {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        /* Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FadeInImage(
              fadeInDuration: const Duration(seconds: 3),
              placeholder: const NetworkImage(
                  'https://acegif.com/wp-content/uploads/loading-11.gif'),
              image: NetworkImage(widget.dataPlace.img)),
        ), */
        const SizedBox(
          height: 25,
        ),
        const Text(
          'Información:',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Accordion(
            headerBackgroundColor: Colors.redAccent,
            contentBorderColor: Colors.redAccent,
            openAndCloseAnimation: Accordion.sectionAnimation,
            contentHorizontalPadding: 10,
            children: [
              AccordionSection(
                  header: const Text(
                    'Destino',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  content: Text(widget.dataPlace.nombre)),
              AccordionSection(
                  header: const Text(
                    'Descripción',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  content: Text(widget.dataPlace.ciudad)),
              AccordionSection(
                  header: const Text(
                    'Ciudad',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  content: Text(widget.dataPlace.departamento)),
              AccordionSection(
                  header: const Text(
                    'Departamento',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  content: Text(widget.dataPlace.descripcion)),
            ]),
        const SizedBox(
          height: 15,
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Ver en Google Maps',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ))
      ],
    ));
  }
}
