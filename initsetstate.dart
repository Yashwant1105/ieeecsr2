import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorChanger(),
    );
  }
}

class ColorChanger extends StatefulWidget {
  @override
  _ColorChangerState createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  late Color _backgroundColor; // Declare background color variable

  @override
  void initState() {
    super.initState();
    _backgroundColor = Colors.grey; // Initialize background color in initState
  }

  void changeColor() {
    setState(() {
      // Update the background color with a random color
      _backgroundColor = _generateRandomColor();
    });
  }

  Color _generateRandomColor() {
    // Function to generate a random color
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Changer'),
      ),
      body: Container(
        color: _backgroundColor, // Set the background color
        child: Center(
          child: ElevatedButton(
            onPressed: changeColor, // Call the function to change color
            child: Text('Change Color'),
          ),
        ),
      ),
    );
  }
}