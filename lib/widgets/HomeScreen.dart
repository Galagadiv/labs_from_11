import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorProvider with ChangeNotifier {
  double _redColor = 0;
  double _greenColor = 0;
  double _blueColor = 0;

  double get redColor => _redColor;
  double get greenColor => _greenColor;
  double get blueColor => _blueColor;

  void updateRedColor(double value) {
    _redColor = value;
    notifyListeners();
  }

  void updateGreenColor(double value) {
    _greenColor = value;
    notifyListeners();
  }

  void updateBlueColor(double value) {
    _blueColor = value;
    notifyListeners();
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 11 with Provider'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(120, 66, 245, 0.4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Color preview box
            Center(
              child: Container(
                height: 150,
                width: 150,
                margin: const EdgeInsets.only(bottom: 100),
                color: Color.fromRGBO(
                  context.watch<ColorProvider>().redColor.toInt(),
                  context.watch<ColorProvider>().greenColor.toInt(),
                  context.watch<ColorProvider>().blueColor.toInt(),
                  1,
                ),
              ),
            ),

            // Red color slider
            Text('Red: ${context.watch<ColorProvider>().redColor.toStringAsFixed(0)}'),
            Slider(
              value: context.watch<ColorProvider>().redColor,
              min: 0,
              max: 255,
              divisions: 255,
              label: context.watch<ColorProvider>().redColor.round().toString(),
              onChanged: (double value) {
                context.read<ColorProvider>().updateRedColor(value);
              },
            ),

            // Green color slider
            Text('Green: ${context.watch<ColorProvider>().greenColor.toStringAsFixed(0)}'),
            Slider(
              value: context.watch<ColorProvider>().greenColor,
              min: 0,
              max: 255,
              divisions: 255,
              label: context.watch<ColorProvider>().greenColor.round().toString(),
              onChanged: (double value) {
                context.read<ColorProvider>().updateGreenColor(value);
              },
            ),

            // Blue color slider
            Text('Blue: ${context.watch<ColorProvider>().blueColor.toStringAsFixed(0)}'),
            Slider(
              value: context.watch<ColorProvider>().blueColor,
              min: 0,
              max: 255,
              divisions: 255,
              label: context.watch<ColorProvider>().blueColor.round().toString(),
              onChanged: (double value) {
                context.read<ColorProvider>().updateBlueColor(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
