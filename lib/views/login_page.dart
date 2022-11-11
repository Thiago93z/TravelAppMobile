import 'package:flutter/material.dart';
import 'package:travel_mobile_app/views/home_page.dart';
import 'package:travel_mobile_app/views/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  late Message msg;

  void confirmUser() async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      msg.showMessage("Bienvenido");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (e) {
      //showMessage(e.code);
      if (e.code == "invalid-email") {
        msg.showMessage("El formato de email no es correcto");
      }
      if (e.code == "user-not-found") {
        msg.showMessage("El usuario no esta resgitrado");
      }
      if (e.code == "wrong-password") {
        msg.showMessage("Clave incorrecta");
      }
      if (e.code == "unknown") {
        msg.showMessage("Complete los datos");
      }
      if (e.code == "network-request-failed") {
        msg.showMessage("Revise su conexion a Internet");
      }
    }
  }

  /* void confirmUser() {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      if (email.text == "messi@gmail.com") {
        if (password.text == "123456") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const Description_Park_Page()));
        } else {
          showMessage("Contraseña Incorrecta");
        }
      } else {
        showMessage("Usuario no registrado");
      }
    } else {
      showMessage("Datos Obligatorios");
    }
  } */

  @override
  Widget build(BuildContext context) {
    msg = Message(context);
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
                      controller: password,
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
                        confirmUser();
                        /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const Description_Park_Page()))); */
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
                          confirmUser();
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

class Message {
  late BuildContext context;
  Message(this.context);

  void showMessage(String message) {
    final view = ScaffoldMessenger.of(context);
    view.showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 20),
      ),
      backgroundColor: const Color.fromARGB(255, 51, 204, 92),
      /* action: SnackBarAction(
        label: 'Aceptar',
        onPressed: () => view.hideCurrentSnackBar(),
      ), */
    ));
  }

  void MessageOK(String message) {
    final view = ScaffoldMessenger.of(context);
    view.showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 20),
      ),
      backgroundColor: Colors.green,
      /* action: SnackBarAction(
        label: 'Aceptar',
        onPressed: () => view.hideCurrentSnackBar(),
      ), */
    ));
  }
}
