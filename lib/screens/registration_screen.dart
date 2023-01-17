import 'package:comchart/constants.dart';
import 'package:comchart/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:comchart/dvigateli/card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kTextFieldDecoratonale.copyWith(hintText: 'Введи е-мыло'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoratonale.copyWith(
                  hintText: 'Введи пароль > 6 символов'),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Builder(
                  builder: (context) => showSpinner
                      ? Center(child: CircularProgressIndicator())
                      : RoundedButton(
                          title: 'Зарегистрировать',
                          colour: Colors.blueAccent,
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              final newUser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              if (newUser != null) {
                                Navigator.pushNamed(context, ChatScreen.id);
                              }
                            } catch (e) {
                              print('e');
                              //                   Scaffold.of(context).showBottomSheet((context) =>
                              // SnackBar(content: Text(e.toString())));
                            } finally {
                              setState(() {
                                showSpinner = false;
                              });
                            }
                          },
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
