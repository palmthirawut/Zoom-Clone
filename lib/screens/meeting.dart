import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/jitsi_meet.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

// ignore: must_be_immutable
class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  bool setJoinMeeting = false;

  joinMeeting(BuildContext context) {
    if (setJoinMeeting) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushNamed(context, '/join');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                  onPressed: createNewMeeting,
                  icon: Icons.videocam,
                  text: 'New Meeting'),
              HomeMeetingButton(
                  onPressed: () {
                    setJoinMeeting = true;
                    joinMeeting(context);
                  },
                  icon: Icons.add_box_rounded,
                  text: 'Join Meeting'),
              HomeMeetingButton(
                  onPressed: () {},
                  icon: Icons.calendar_today,
                  text: 'Schedule'),
              HomeMeetingButton(
                  onPressed: () {},
                  icon: Icons.arrow_upward_rounded,
                  text: 'Share Screen'),
            ],
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Create/Join Meetings with just a click!',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
