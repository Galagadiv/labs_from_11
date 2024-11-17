import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  double _redColor = 0;
  double _greenColor = 0;
  double _blueColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 11'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(120, 66, 245, 0.4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                height: 150,
                width: 150,
                margin: EdgeInsets.only(bottom: 100),
                color: Color.fromRGBO(_redColor.toInt(), _greenColor.toInt(), _blueColor.toInt(), 1),
              ),]
            ),

            Text('Red: ${_redColor.toStringAsFixed(0)}'),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: _redColor,
                    min: 0,
                    max: 255,
                    divisions: 255,
                    label: _redColor.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _redColor = value;
                      });
                    },
                  ),
                ),
              ],
            ),

            Text('Green: ${_greenColor.toStringAsFixed(0)}'),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: _greenColor,
                    min: 0,
                    max: 255,
                    divisions: 255,
                    label: _greenColor.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _greenColor = value;
                      });
                    },
                  ),
                ),
              ],
            ),

            Text('Blue: ${_blueColor.toStringAsFixed(0)}'),
            Row(
              children: [
                Expanded(
                  child: Slider(
                    value: _blueColor,
                    min: 0,
                    max: 255,
                    divisions: 255,
                    label: _blueColor.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _blueColor = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
