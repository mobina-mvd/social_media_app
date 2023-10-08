import 'package:flutter/material.dart';
import 'package:social_media_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Social Media App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
        // useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
