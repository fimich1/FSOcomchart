import 'package:flutter/material.dart';
import 'package:comchart/screens/chat_screen.dart';
import 'package:comchart/screens/login_screen.dart';
import 'package:comchart/screens/registration_screen.dart';
import 'package:comchart/screens/welcome_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}
