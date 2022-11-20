import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_mobile_app/model/user_model.dart';
import 'package:travel_mobile_app/repository/user_repository.dart';
import 'package:travel_mobile_app/views/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Gender { female, male }

class _RegisterPageState extends State<RegisterPage> {
  final names = TextEditingController();
  final lastNames = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();
  UserRegister user = UserRegister();
  late Message msg;

  Gender? _gender = Gender.male;

  void saveUser(Usuario newUser) async {
    var result = await user.registerUser(email.text, password.text);

    if (result == "invalid-email") {
      msg.showMessage("El formato de email no es correcto");
    } else if (result == "weak-password") {
      msg.showMessage("la Clave deberia contener un minimo 6 caracteres");
    } else if (result == "unknown") {
      msg.showMessage("Complete los datos");
    } else if (result == "network-request-failed") {
      msg.showMessage("Revise su conexion a Internet");
    } else if (result == "email-already-in-use") {
      msg.showMessage("El correo ya fue registrado");
    } else {
      newUser.id = result;
      registerUser(newUser);
      msg.messageOK("Usuario creado exitosamente");
    }
    /* bool result = await user.registerUser(email.text, password.text);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage())); */
  }

  void registerUser(Usuario newUser) async {
    var id = await user.createUser(newUser);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void getData() {
    setState(() {
      if (password.text == passwordConfirm.text) {
        if (names.text.isNotEmpty &&
            lastNames.text.isNotEmpty &&
            email.text.isNotEmpty &&
            address.text.isNotEmpty &&
            phone.text.isNotEmpty &&
            passwordConfirm.text.isNotEmpty &&
            password.text.isNotEmpty) {
          String gen = "female";
          if (_gender == Gender.male) {
            gen = "Male";
          }
          var newUser = Usuario("", names.text, lastNames.text, phone.text,
              address.text, gen, email.text, password.text);
          saveUser(newUser);
        } else {
          msg.showMessage("Datos incompletos");
        }
      } else {
        msg.showMessage("Contrasenas no coinciden");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    msg = Message(context);
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
                            leading: Radio<Gender>(
                              value: Gender.male,
                              groupValue: _gender,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.yellow),
                              onChanged: (Gender? value) {
                                setState(() {
                                  _gender = value;
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
                            leading: Radio<Gender>(
                              value: Gender.female,
                              groupValue: _gender,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.yellow),
                              onChanged: (Gender? value) {
                                setState(() {
                                  _gender = value;
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
                          getData();
                          /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const LoginPage()))): */
                        },
                        child: Text(
                          "Registrar",
                          style: GoogleFonts.exo(
                            textStyle: const TextStyle(
                              color: Colors.white,
                            ),
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
