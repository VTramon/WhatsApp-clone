import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/screens/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF008069),
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF008069),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        splashColor: Colors.white,
        highlightColor: Colors.white,
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
        ),
        colorScheme: const ColorScheme(
          background: Color(0xFF008069),
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
