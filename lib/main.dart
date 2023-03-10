import 'package:flutter/material.dart';
import 'package:comchart/screens/chat_screen.dart';
import 'package:comchart/screens/login_screen.dart';
import 'package:comchart/screens/registration_screen.dart';
import 'package:comchart/screens/welcome_screen.dart';
import 'package:comchart/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';

//void main() => runApp(const FlashChat());
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}
class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
       WelcomeScreen.id: (context) => WelcomeScreen(),
       ChatScreen.id: (context) => ChatScreen(),
       LoginScreen.id: (context) => LoginScreen(),
       RegistrationScreen.id: (context) => RegistrationScreen(),
      },
                     //для роутера из примеров 2023
                     // routerConfig: _router,
    );
  }
}


//
// // перенаправлеие страниц, основное тело вверху
// final GoRouter _router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       pageBuilder: (context, state) => MaterialPage<void>(
//         key: state.pageKey,
//         child: WelcomeScreen(),
//       ),
//     ),
//     GoRoute(
//       path: '/page1',
//       pageBuilder: (context, state) => MaterialPage<void>(
//         key: state.pageKey,
//         child: RegistrationScreen(),
//       ),
//     ),
//     GoRoute(
//       path: '/page2',
//       pageBuilder: (context, state) => MaterialPage<void>(
//         key: state.pageKey,
//         child: LoginScreen(),
//       ),
//     ),
//     GoRoute(
//       path: '/page3',
//       pageBuilder: (context, state) => MaterialPage<void>(
//         key: state.pageKey,
//         child: ChatScreen(),
//       ),
//     ),
//   ],
// );
