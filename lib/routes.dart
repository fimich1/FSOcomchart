import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const Page1Page(),
      ),
    ),
    GoRoute(
      path: '/page2',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const Page2Page(),
      ),
    ),
    GoRoute(
      path: '/page2',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const Page2Page(),
      ),
    ),
    GoRoute(
      path: '/page2',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const Page2Page(),
      ),
    ),
  ],

);