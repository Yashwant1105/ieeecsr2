import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _result = '';

  void _add() {
    setState(() {
      _result = (_controller1.text.isEmpty || _controller2.text.isEmpty)
          ? 'Please enter both numbers'
          : (double.parse(_controller1.text) + double.parse(_controller2.text)).toString();
    });
  }

  void _multiply() {
    setState(() {
      _result = (_controller1.text.isEmpty || _controller2.text.isEmpty)
          ? 'Please enter both numbers'
          : (double.parse(_controller1.text) * double.parse(_controller2.text)).toString();
    });
  }

  void _subtract() {
    setState(() {
      _result = (_controller1.text.isEmpty || _controller2.text.isEmpty)
          ? 'Please enter both numbers'
          : (double.parse(_controller1.text) - double.parse(_controller2.text)).toString();
    });
  }

  void _divide() {
    setState(() {
      if (_controller2.text.isEmpty || _controller2.text == '0') {
        _result = 'Cannot divide by zero';
      } else {
        _result = (double.parse(_controller1.text) / double.parse(_controller2.text)).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _controller1,
                decoration: InputDecoration(
                  labelText: 'Number 1',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controller2,
                decoration: InputDecoration(
                  labelText: 'Number 2',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _add,
                    child: Text('+'),
                  ),
                  ElevatedButton(
                    onPressed: _multiply,
                    child: Text('*'),
                  ),
                  ElevatedButton(
                    onPressed: _subtract,
                    child: Text('-'),
                  ),
                  ElevatedButton(
                    onPressed: _divide,
                    child: Text('/'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                _result,
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}