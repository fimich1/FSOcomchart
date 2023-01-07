import 'package:comchart/screens/chat_screen.dart';
import 'package:comchart/screens/login_screen.dart';
import 'package:comchart/screens/registration_screen.dart';
import 'package:comchart/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: WelcomeScreen(),
      ),
    ),
    GoRoute(
      path: '/page1',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: RegistrationScreen(),
      ),
    ),
    GoRoute(
      path: '/page2',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/page3',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: ChatScreen(),
      ),
    ),
    // GoRoute(
    //   path: '/age3',
    //   errorPageBuilder: (context, state) => MaterialPage<void>(
    //     key: state.pageKey,
    //     child: ErrorPage(state.error),
    //   ),
    // ),



  ],

);