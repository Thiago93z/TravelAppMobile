import 'package:flutter/material.dart';
import 'package:travel_mobile_app/model/place_model.dart';
import 'package:travel_mobile_app/views/home_page.dart';

class DetailPlace extends StatefulWidget {
  final Place dataPlace;
  const DetailPlace(this.dataPlace, {super.key});

  @override
  State<DetailPlace> createState() => _DetailPlaceState();
}

class _DetailPlaceState extends State<DetailPlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dataPlace.nombre),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: MiCardImage(
              widget.dataPlace.img,
              widget.dataPlace.ciudad +
                  " - " +
                  widget.dataPlace.departamento +
                  "\n" +
                  "\n" +
                  widget.dataPlace.descripcion),
        ),
      ),
    );
  }
}
