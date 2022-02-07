import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
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
                "Bienvenido a VIFI ZOOM la mejor plataforma de video conferencia empresarial",
            image: Center(
              child: Image.asset('images/welcome.png', height: 175),
            ),
            decoration: PageDecoration(
                bodyTextStyle: mystyle(20, Colors.black),
                titleTextStyle: mystyle(20, Colors.black))),
        PageViewModel(
            title: "Unete o empieza una Reunión",
            body:
                "Una app facil de usar y potente, unete o empieza una reunion de manera rapida",
            image: Center(
              child: Image.asset('images/conference.png', height: 175),
            ),
            decoration: PageDecoration(
                bodyTextStyle: mystyle(20, Colors.black),
                titleTextStyle: mystyle(20, Colors.black))),
        PageViewModel(
          title: "Seguridad",
          body:
              "Tu seguirdad es importante para nosotros, nuestros servidores son seguros y están encriptados ",
          image: Center(
            child: Image.asset('images/secure.jpg', height: 175),
          ),
          decoration: PageDecoration(
            bodyTextStyle: mystyle(20, Colors.black),
            titleTextStyle: mystyle(20, Colors.black),
          ),
        )
      ],
      onDone: () {
        print("Done");
      },
      onSkip: () {},
      showSkipButton: true,
      skip: const Icon(Icons.skip_next, size: 45),
      next: const Icon(Icons.arrow_forward_ios),
      done: Text(
        "Done",
        style: mystyle(20, Colors.black),
      ),
    );
  }
}
