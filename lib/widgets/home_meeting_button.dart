import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const HomeMeetingButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(0, 4))
                  ]),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                  color: Color.fromARGB(255, 123, 123, 123), fontSize: 12),
            ),
          ],
        ));
  }
}
