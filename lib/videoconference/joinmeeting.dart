import 'dart:io' show Platform;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vifi_meet/variables.dart';

class JoinMeeting extends StatefulWidget {
  @override
  _JoinMeetingState createState() => _JoinMeetingState();
  // TODO: implement createState

}

class _JoinMeetingState extends State<JoinMeeting> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController roomcontroller = TextEditingController();
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  String username = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata();
  }

  getuserdata() async {
    DocumentSnapshot userdoc =
        await usercollection.doc(FirebaseAuth.instance.currentUser?.uid).get();
    setState(() {
      username = userdoc.get('username') ?? '';
    });
  }

  joinmeeting() async {
    try {
      bool isAndroid = Theme.of(context).platform == TargetPlatform.android;
      bool isIos = Theme.of(context).platform == TargetPlatform.iOS;

      Map<FeatureFlagEnum, bool> feautueflags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false
      };
      if (isAndroid) {
        feautueflags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] == false;
      } else if (isIos) {
        feautueflags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
      var options = JitsiMeetingOptions(room: roomcontroller.text)
        ..userDisplayName =
            namecontroller.text == '' ? username : namecontroller.text
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted
        ..featureFlags.addAll(feautueflags);
      await JitsiMeet.joinMeeting(options);
    } catch (e) {
      print("ERROR $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                "Código de reunión",
                style: mystyle(20),
              ),
              SizedBox(
                height: 20,
              ),
              PinCodeTextField(
                controller: roomcontroller,
                appContext: context,
                length: 6,
                autoDisposeControllers: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(shape: PinCodeFieldShape.underline),
                animationDuration: Duration(milliseconds: 300),
                onChanged: (value) {},
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:
                      "Nombre (Deja en blanco si quieres tu nombre de usuario)",
                  labelStyle: mystyle(11),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CheckboxListTile(
                value: isVideoMuted,
                onChanged: (value) {
                  setState(() {
                    isAudioMuted = value!;
                  });
                },
                title: Text(
                  "Video en desactivado",
                  style: mystyle(18, Colors.black),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CheckboxListTile(
                value: isAudioMuted,
                onChanged: (value) {
                  setState(() {
                    isAudioMuted = value!;
                  });
                },
                title: Text(
                  "Video en silencio",
                  style: mystyle(18, Colors.black),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Puedes cambiar esta configuración una vez que estés en la reunión",
                  style: mystyle(13, Colors.indigo[600]),
                  textAlign: TextAlign.center),
              Divider(
                height: 48,
                thickness: 2.0,
              ),
              InkWell(
                onTap: () => joinmeeting(),
                child: Container(
                  width: double.infinity,
                  height: 64,
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: GradientColors.beautifulGreen),
                  ),
                  child: Center(
                    child: Text(
                      "Únete a la reunión",
                      style: mystyle(20, Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
