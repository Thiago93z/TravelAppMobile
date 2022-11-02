import 'package:flutter/material.dart';
import 'package:travel_mobile_app/views/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genero { female, male }

class _RegisterPageState extends State<RegisterPage> {
  final names = TextEditingController();
  final lastNames = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();

  Genero? _genero = Genero.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/termales.jpg"),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      margin: const EdgeInsets.all(30),
                      //color: Colors.greenAccent,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(180),
                        border: Border.all(color: Colors.deepOrange, width: 3),
                        color: Colors.black87,
                      ),
                      child: const Image(
                        image: AssetImage("assets/img/LogoBapp.png"),
                        width: 180,
                        height: 180,
                      ), //alignment: ,
                    ),
                    TextFormField(
                      controller: names,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: "Names",
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
                          /*enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 3, color: Colors.yellow),
                              
                              ),*/
                          suffixIcon: const Icon(
                            Icons.person,
                            color: Colors.black87,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: lastNames,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: "lastNames",
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
                            Icons.person,
                            color: Colors.black87,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: email,
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
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: "Phone",
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
                            Icons.phone_android,
                            color: Colors.black87,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: address,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                          labelText: "Address",
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
                            Icons.add_location_alt_outlined,
                            color: Colors.black87,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: const Text(
                              'Male',
                              style: TextStyle(
                                  color: Color.fromARGB(233, 255, 255, 255)),
                            ),
                            leading: Radio<Genero>(
                              value: Genero.male,
                              groupValue: _genero,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.yellow),
                              onChanged: (Genero? value) {
                                setState(() {
                                  _genero = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: const Text(
                              'Female',
                              style: TextStyle(
                                  color: Color.fromARGB(233, 255, 255, 255)),
                            ),
                            leading: Radio<Genero>(
                              value: Genero.female,
                              groupValue: _genero,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.yellow),
                              onChanged: (Genero? value) {
                                setState(() {
                                  _genero = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: password,
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
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: passwordConfirm,
                      //keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                          labelText: "Confirm Password",
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
                            Icons.vpn_key_off_rounded,
                            color: Colors.black87,
                          )),
                    ),
                    const SizedBox(
                      height: 40,
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
                                      const LoginPage())));
                        },
                        child: const Text(
                          "Registrar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
