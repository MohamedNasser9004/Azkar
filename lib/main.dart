import 'package:azkar/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade200,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          textTheme: TextTheme(
            titleSmall: TextStyle(fontFamily: "Tajawal",
            fontSize: 22.0,
            )
          ),
          centerTitle: true,
          elevation: 0,
        )
      ),
    );
  }
}

