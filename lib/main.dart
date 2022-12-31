import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uasku101/pages/admin.dart';
import 'package:uasku101/pages/login.dart';
import 'package:uasku101/pages/mahasiswa.dart';

import 'pages/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: LoginPage(),
    );
  }
}
