import 'package:flutter/material.dart';
import 'package:travel_mobile_app/views/poi_page.dart';
import 'package:travel_mobile_app/views/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/salento2.jpg"),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(30),
                      //color: Colors.greenAccent,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(180),
                        border: Border.all(color: Colors.deepOrange, width: 3),
                        color: Colors.black87,
                      ),
                      child: const Image(
                        image: AssetImage("assets/img/LogoBapp.png"),
                        width: 200,
                        height: 200,
                      ), //alignment: ,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "E-mail",
                          fillColor: Colors.white60,
                          filled: true,
                          labelStyle: const TextStyle(
                            color: Colors.black87,
                            decorationStyle: TextDecorationStyle.dotted,
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          suffixIcon: const Icon(
                            Icons.email_sharp,
                            color: Colors.black87,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      //keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                          labelText: "Password",
                          fillColor: Colors.white60,
                          filled: true,
                          labelStyle: const TextStyle(
                            color: Colors.black87,
                            decorationStyle: TextDecorationStyle.dotted,
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          suffixIcon: const Icon(
                            Icons.vpn_key_rounded,
                            color: Colors.black87,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            shadowColor: Colors.greenAccent,
                            fixedSize: const Size(150, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            textStyle: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 20)), //styleFrom
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                  const Description_Park_Page())));
                        },
                          child: const Text(
                            "Iniciar Sesion",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(255, 54, 20, 7))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const RegisterPage())));
                        },
                        child: const Text(
                          "Registrarse",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.greenAccent,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
