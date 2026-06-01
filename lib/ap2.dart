import 'package:flutter/material.dart';

void main() => runApp(StacksDemo());

class StacksDemo extends StatelessWidget {
  static const double outerSize = 100;
  static const double innerSize = 50;
  static const double offsetStep = 12;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 51, 50, 50),
        body: SafeArea(
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _stackedBox(
                  background: Colors.grey[400],
                  colors: [Colors.red, Colors.green, Colors.blue],
                ),
                const SizedBox(width: 16),
                _stackedBox(
                  background: Colors.black,
                  colors: [Colors.blue, Colors.purple, Colors.yellow],
                ),
                const SizedBox(width: 16),
                _stackedBox(
                  background: Colors.transparent,
                  colors: [Colors.red, Colors.yellow, Colors.blue],
                ),
                const SizedBox(width: 16),
                _stackedBox(
                  background: Colors.white,
                  colors: [Colors.red, Colors.deepOrange, Colors.yellow, Colors.lightGreenAccent],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _stackedBox({Color? background, required List<Color> colors}) {
    // Build a 100x100 outer area and stack inner 50x50 squares offset diagonally
    return Container(
      width: outerSize,
      height: outerSize,
      color: background,
      child: Stack(
        children: _buildStackedSquares(colors),
      ),
    );
  }

  List<Widget> _buildStackedSquares(List<Color> colors) {
    final List<Widget> widgets = [];
    for (var i = 0; i < colors.length; i++) {
      final double offset = i * offsetStep;
      widgets.add(Positioned(
        left: offset,
        top: offset,
        child: Container(
          width: innerSize,
          height: innerSize,
          color: colors[i],
        ),
      ));
    }
    return widgets;
  }
}
