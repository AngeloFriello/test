import 'package:flutter/material.dart';
import 'package:test/pages/event.dart';
import 'package:test/pages/films.dart';
import 'package:test/pages/login.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/'       : (context) => Login(key: UniqueKey()),
        '/films'  : (context) => Films(key: UniqueKey()),
        '/event'  : (context) => Event(key: UniqueKey()),

      }
    )
  );
}
