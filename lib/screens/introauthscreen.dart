import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:vifi_meet/authentication/navigateauthscreen.dart';
import 'package:vifi_meet/variables.dart';

class IntroAuthScreen extends StatefulWidget {
  @override
  _IntroAuthScreenState createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: "Bienvenido",
            body:
                "Bienvenido a VIFI la mejor plataforma de videoconferencia empresarial",
            image: Center(
              child: Image.asset('images/welcome.png', height: 175),
            ),
            decoration: PageDecoration(
                bodyTextStyle: mystyle(20, Colors.black),
                titleTextStyle: mystyle(20, Colors.black))),
        PageViewModel(
            title: "Únete o empieza una Reunión",
            body:
                "Una app fácil de usar y potente, que esperas empieza una reunión de manera rápida",
            image: Center(
              child: Image.asset('images/conference.png', height: 175),
            ),
            decoration: PageDecoration(
                bodyTextStyle: mystyle(20, Colors.black),
                titleTextStyle: mystyle(20, Colors.black))),
        PageViewModel(
          title: "Seguridad",
          body:
              "Tu seguridad es importante para nosotros, nuestros servidores son seguros y están encriptados",
          image: Center(
            child: Image.asset('images/secure.png', height: 175),
          ),
          decoration: PageDecoration(
            bodyTextStyle: mystyle(20, Colors.black),
            titleTextStyle: mystyle(20, Colors.black),
          ),
        )
      ],
      onDone: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavigateAuthScreen()));
      },
      onSkip: () {},
      showSkipButton: true,
      skip: const Icon(Icons.skip_next, size: 45),
      next: const Icon(Icons.arrow_forward_ios),
      done: Text(
        "OK",
        style: mystyle(20, Colors.black),
      ),
    );
  }
}
