import 'package:flutter/material.dart';
import 'package:flutter_assessment/model/string_calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter String Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final StringCalculator calculator = StringCalculator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('String Calculator'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            try {
            
              int result = calculator.add("1,2,3");
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Calculation Result'),
                  content: Text('The result is: $result'),
                ),
              );
            } catch (e) {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Error'),
                  content: Text(e.toString()),
                ),
              );
            }
          },
          child: Text('Calculate 1,2,3'),
        ),
      ),
    );
  }
}
