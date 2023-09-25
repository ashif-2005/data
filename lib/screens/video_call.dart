import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';
final String localUserID = math.Random().nextInt(10000).toString();
final String ConId =  math.Random().nextInt(999).toString();
const String callID = "group_call_id";
var conferenceDTextCtrl1 = TextEditingController();



class VedioCall extends StatefulWidget {
  const VedioCall ({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<VedioCall > {
  var conferenceDTextCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(
              //   Icons.video_call,
              //   size: 100,
              //   color: Colors.blue[900],
              // ),
              // Text(
              //   "Video call with Zego Cloud",
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     color: Colors.blue[900],
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: conferenceDTextCtrl1,
                      decoration:
                      const InputDecoration(labelText: "Enter Name"),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Expanded(
                  //   child: TextFormField(
                  //     controller: conferenceDTextCtrl,
                  //     decoration: const InputDecoration(
                  //         labelText: "Join a conference by id"),
                  //   ),
                  // ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return VideoConferencePage(
                              // conferenceID: conferenceDTextCtrl.text,
                              conferenceID: ConId,
                            );
                          }),
                        );
                      },
                      child:  Text("join")),
                  Container(
                    color: Colors.lightBlueAccent,
                    height:100,
                    width: 100,
                    child: Center(child: Text(ConId,style: GoogleFonts.dmSans(color: Colors.black,fontSize:25),)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoConferencePage extends StatelessWidget {
  final String conferenceID;

  const VideoConferencePage({
    Key? key,
    required this.conferenceID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltVideoConference(
        appID: 1689633023,
        appSign:
        "8aea1715caf946603b1153a7f617a1bd9426c0ae6acf2048261e6a25b238b27f",
        userID: localUserID,
        userName: conferenceDTextCtrl1.text,
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(),
      ),
    );
  }
}