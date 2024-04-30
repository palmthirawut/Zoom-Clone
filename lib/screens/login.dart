import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethod = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Text title login
        const Text(
          'Start or join a meeting',
          style: TextStyle(
            color: titleColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        //Asset image
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 38.0),
          child: Image.asset('assets/images/onboarding.png'),
        ),

        //button google login
        CustomButton(
            text: 'Google Sign In',
            onPressed: () async {
              bool res = await _authMethod.signInWithGoogle(context);
              if (res) {
                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, '/home');
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              }
            })
      ],
    ));
  }
}
