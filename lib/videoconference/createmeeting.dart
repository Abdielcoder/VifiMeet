import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:uuid/uuid.dart';
import 'package:vifi_meet/variables.dart';

class CreateMeeting extends StatefulWidget {
  @override
  _CreateMeetingState createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  String code = '';
  createcode() {
    setState(() {
      code = Uuid().v1().substring(0, 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text("Crea un código de reunión y compártelo ",
                style: mystyle(20), textAlign: TextAlign.center),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Código",
                style: mystyle(30),
              ),
              Text(
                code,
                style: mystyle(30, Colors.deepPurple, FontWeight.w700),
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () => createcode(),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: GradientColors.facebookMessenger),
              ),
              child: Center(
                child: Text(
                  "Crea un código",
                  style: mystyle(20, Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
