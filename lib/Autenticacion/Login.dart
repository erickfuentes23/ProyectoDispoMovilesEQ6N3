import 'package:app_flutter/SQLite/sqlite.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter/assets/Login/users.dart';
import 'package:app_flutter/View/navbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();

  bool isVisible = false;

  bool isLoginTrue = false;

  final db = DatabaseHelper();

  login() async {
    var response =
        await db.login(Users(username: username.text, password: password.text));

    if (response == true) {
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Navbar()));
    } else {
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                //logo
                Image.asset(
                  "lib/assets/login.png",
                  width: 200,
                ),
                const SizedBox(height: 20),
                //usuario
                Container(
                  margin: EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.amberAccent.withOpacity(.4)),
                  child: TextFormField(
                    controller: username,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Debes ingresar un usuario";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      border: InputBorder.none,
                      hintText: "Usuario",
                    ),
                  ),
                ),

                //contraseña
                Container(
                  margin: EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.amberAccent.withOpacity(.4)),
                  child: TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Debes ingresar una contraseña";
                      }
                      return null;
                    },
                    obscureText: !isVisible,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "Contraseña",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: Icon(isVisible
                                ? Icons.visibility
                                : Icons.visibility_off))),
                  ),
                ),

                //apartado de login
                const SizedBox(height: 30),
                Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepOrange),
                    child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            login();
                          }
                        },
                        child: const Text(
                          "Iniciar Sesión",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ))),

                isLoginTrue
                    ? const Text(
                        "Usuario o contraseña estan incorrectos",
                        style: TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
              ],
            )),
      )),
    ));
  }
}
