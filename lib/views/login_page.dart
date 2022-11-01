import 'package:flutter/material.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 115, 159, 121),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 55),
          child: Center(
              child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: const EdgeInsets.all(30),
                //color: Colors.greenAccent,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(180),
                  border: Border.all(color: Colors.black38, width: 3),
                  color: Colors.greenAccent,
                ),
                child: const Image(
                  image: AssetImage("assets/img/LogoBapp.png"),
                  width: 100,
                  height: 100,
                ), //alignment: ,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "User",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.person_add_alt_sharp),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                obscureText: true,
                //keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.vpn_key_rounded),
                ),
              ),
              const SizedBox(
                height: 10,
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
                            builder: ((context) => const RegisterPage())));
                  },
                  child: const Text(
                    "Registrarse",
                  )),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      fixedSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      shadowColor: Colors.orange,
                      textStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 22,
                      )),
                  onPressed: () {},
                  child: const Text("Ingresar"))
            ],
          )),
        ),
      ),
    );
  }
}
