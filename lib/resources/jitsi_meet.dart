import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/firestore.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      String name;
      if (username.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetConferenceOptions(
        room: roomName,
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
        },
        featureFlags: {
          FeatureFlags.welcomePageEnabled: false,
          FeatureFlags.resolution: FeatureFlagVideoResolutions.resolution720p,
        },
        userInfo: JitsiMeetUserInfo(
            displayName: name,
            email: _authMethods.user.email,
            avatar: _authMethods.user.photoURL),
      );

      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet().join(options);
    } catch (error) {
      // ignore: avoid_print
      print("error: $error");
    }
  }
}
