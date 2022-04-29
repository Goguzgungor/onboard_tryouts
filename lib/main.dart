import 'package:crewin_app/ui/auth_view.dart';
import 'package:crewin_app/ui/landing_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 103, 103, 105),
          secondary: Color(0xFFBDBCBC),
          background: Color(0xFFF1EBEB),
        ),
      ),
      title: 'Test App',
      home: LandingView(),
    );
  }
}
