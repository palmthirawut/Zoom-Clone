import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/screens/home.dart';
import 'package:zoom_clone/screens/join_meeting.dart';
import 'package:zoom_clone/screens/login.dart';
import 'package:zoom_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme:
          ThemeData.light().copyWith(scaffoldBackgroundColor: backgroundColor),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/join': (context) => const JoinMeeting(),
      },
      home: StreamBuilder<User?>(
          stream: AuthMethods().authChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasData) {
              return const HomeScreen();
            } else {
              return const LoginScreen();
            }
          }),
    );
  }
}
