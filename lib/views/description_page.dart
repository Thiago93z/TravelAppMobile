// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
  }
class _DescriptionPageState extends State<DescriptionPage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

          appBar: AppBar(),
    );
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'assets/images/entrada.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.fitHeight,
                )
          ),

          Container(
              width: double.infinity,
              height: 400,
              decoration: const BoxDecoration(
                color:Colors.cyan,
              ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                      child: SelectionArea(
                          child: Text(
                          '\n  Ciudad: Montenegro\n  Departamento: Quindio\n  Temperatura: 23° promedio',
                          ),
                  )),
                  ],
                ),
    )]));
}
