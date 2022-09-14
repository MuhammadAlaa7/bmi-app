import 'package:bmi/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor:  Color(0xFF0A0D22),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0D22),

      ),

    home: const InputPage(),

    );
  }
}




