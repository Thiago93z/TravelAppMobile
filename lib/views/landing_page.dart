import 'package:flutter/material.dart';
import 'package:travel_mobile_app/views/login_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    pasarPage();
    super.initState();
  }

  Future<void> pasarPage() async {
    Future.delayed(const Duration(seconds: 5), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/cocora.jpg"), fit: BoxFit.fill)),
        child: Center(
            child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          margin: const EdgeInsets.all(30),
          //color: Colors.greenAccent,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(180),
            border: Border.all(color: Colors.deepOrange, width: 3),
            color: Colors.black87,
          ),
          child: const Image(
            image: AssetImage("assets/img/LogoBapp.png"),
            width: 250,
            height: 250,
          ), //alignment: ,
        )),
      ),
    );
  }
}
