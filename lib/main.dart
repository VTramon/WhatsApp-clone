import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          background: Color.fromARGB(255, 0, 168, 132),
          brightness: Brightness.light,
          onBackground: Colors.white,
          primary: Colors.white,
          onPrimary: Color.fromARGB(255, 17, 27, 33),
          secondary: Color.fromARGB(255, 240, 242, 245),
          onSecondary: Color.fromARGB(255, 102, 119, 133),
          error: Colors.red,
          onError: Colors.white,
          surface: Color.fromARGB(255, 217, 253, 211),
          onSurface: Color.fromARGB(255, 17, 27, 33),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
