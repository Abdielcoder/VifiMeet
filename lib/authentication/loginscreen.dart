import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

import '../variables.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[250],
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: GradientColors.blue)),
              child: Center(
                child: Image.asset(
                  'images/logo.png',
                  height: 100,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  margin: EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: TextField(
                          style: mystyle(18, Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Correo",
                              prefixIcon: Icon(Icons.email),
                              hintStyle:
                                  mystyle(20, Colors.grey, FontWeight.w700)),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: TextField(
                          style: mystyle(18, Colors.black),
                          decoration: InputDecoration(
                              hintText: "Contraseña",
                              prefixIcon: Icon(Icons.lock),
                              hintStyle:
                                  mystyle(20, Colors.grey, FontWeight.w700)),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 60,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: GradientColors.riverCity),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "Ingresar",
                              style: mystyle(30, Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}
