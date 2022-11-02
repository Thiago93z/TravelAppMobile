import 'package:flutter/material.dart';

// ignore: camel_case_types
class Description_Park_Page extends StatefulWidget {
  const Description_Park_Page({super.key});


  @override
  State<Description_Park_Page> createState() => _Description_Park_PageState();
}

// ignore: camel_case_types
class _Description_Park_PageState extends State<Description_Park_Page> {
  get animationsMap => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        automaticallyImplyLeading: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations
                  .of(context)
                  .openAppDrawerTooltip,
            );
          },
        ),
        title: const Align(
          alignment: AlignmentDirectional(-1, -0.35),
          child: Text(
            'Descripción Parque del Café',
          ),
        ),
        actions: const [
          Align(
            alignment: AlignmentDirectional(-0.55, 0),
            child: Icon(
              Icons.settings_outlined,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Image.asset(
                  'assets/img/entrada.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fitHeight,
                )
            ),
            Container(
              width: double.maxFinite,
              height: 400,
              decoration: const BoxDecoration(
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: SelectionArea(
                        child: Text(
                            '\n  Ciudad: Montenegro\n  Departamento: Quindio\n  Temperatura: 23° promedio'
                        )),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Align(
                        alignment: AlignmentDirectional(1, 0),
                        child: SelectionArea(
                            child: Text(
                              '\nUbicado en el corazón del Quindío e inmerso en la riqueza natural del Eje Cafetero colombiano se encuentra el Parque del Café, catalogado como uno de los mejores de Latinoamérica. Brinda una experiencia llena de diversión, aprendizaje sobre la cultura cafetera y gran aventura entre atracciones mecánicas, shows y atractivos culturales; una experiencia inolvidable para vivir con familia y amigos.\n\n      Abierto al público de miércoles a domingo y dias festivos\n                        Ingreso al Parque: 9:00am. a 1:00pm.\n                                Cierre de operación: 6:00pm.\n\n',
                              textAlign: TextAlign.justify,
                            )
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/img/krater.jpeg',
                        width: 98,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/img/bambusario.jpg',
                        width: 98,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/img/yippe.jpg',
                        width: 98,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/img/varias atrac.png',
                        width: 98,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]));
  }
}