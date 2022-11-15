import 'package:citra_v2/locator.dart';
import 'package:citra_v2/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  setupServices();
  runApp(MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: const FirebaseOptions(
      projectId: "citrav2",
      appId: "1:203491870934:android:b309a12aa8fcb6f9726177",
      apiKey: "AIzaSyAlG31xNp0iMJHyZaxF4cARNiCWj_DqQOk",
      messagingSenderId: "",
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}