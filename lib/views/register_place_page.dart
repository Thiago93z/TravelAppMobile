import 'package:flutter/material.dart';
import 'package:travel_mobile_app/model/place_model.dart';
import 'package:travel_mobile_app/repository/place_repository.dart';
import 'package:travel_mobile_app/views/home_page.dart';
import 'package:travel_mobile_app/views/login_page.dart';
import 'package:travel_mobile_app/views/menu_page.dart';

class RegisterPlacePage extends StatefulWidget {
  const RegisterPlacePage({Key? key}) : super(key: key);

  @override
  State<RegisterPlacePage> createState() => _RegisterPlacePageState();
}

class _RegisterPlacePageState extends State<RegisterPlacePage> {
  final nombre = TextEditingController();
  final ciudad = TextEditingController();
  final descripcion = TextEditingController();
  final departamento = TextEditingController();
  PlaceRepository placeNew = PlaceRepository();
  late Message msg;

  void traerDatos() {
    setState(() {
      String img =
          "https://firebasestorage.googleapis.com/v0/b/travel-app-mobile.appspot.com/o/salento.jpg?alt=media&token=2022c41f-75d5-420f-904d-eb810f031427";
      if (nombre.text.isNotEmpty &&
          ciudad.text.isNotEmpty &&
          descripcion.text.isNotEmpty &&
          departamento.text.isNotEmpty) {
        var newPlace = Place("", nombre.text, descripcion.text, ciudad.text,
            departamento.text, img);
        registerPlace(newPlace);
      }
    });
  }

  void registerPlace(Place place) async {
    var respuesta = await placeNew.registerPlace(place);
    if (respuesta == "Ya tienes este lugar en tu lista") {
      msg.MessageOK("Este lugar ya se encuentra registrado en tu lista.");
    } else {
      msg.MessageOK("lugar registrado exitosamente.");
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    msg = Message(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Nuevo Lugar"),
      ),
      drawer: MenuPage(),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/cocora.jpg"), fit: BoxFit.cover)),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: SingleChildScrollView(
                child: Center(
                    child: Column(children: [
              TextFormField(
                controller: nombre,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: "Nombre",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.landscape,
                      color: Colors.white,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descripcion,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: "Descripcion",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.landscape,
                      color: Colors.white,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: ciudad,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: "Ciudad",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.landscape,
                      color: Colors.white,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: departamento,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: "Departamento",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.landslide,
                      color: Colors.white,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black12,
                      fixedSize: const Size(200, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      textStyle: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 20)),
                  onPressed: () {
                    traerDatos();
                  },
                  child: const Text("Registrar Lugar"))
            ])))),
      ),
    );
  }
}
