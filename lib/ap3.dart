import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(ShapeSwitcherApp());

class ShapeSwitcherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShapeSwitcherPage(),
    );
  }
}

class ShapeSwitcherPage extends StatefulWidget {
  @override
  _ShapeSwitcherPageState createState() => _ShapeSwitcherPageState();
}

class _ShapeSwitcherPageState extends State<ShapeSwitcherPage> {
  bool _isCircle = true;
  Color _color = Colors.yellow; 
  final Random _rnd = Random();

  void _toggleShape() {
    setState(() => _isCircle = !_isCircle);
  }

  void _randomizeColor() {
    setState(() {
      _color = Color.fromARGB(
        0xFF,
        _rnd.nextInt(256),
        _rnd.nextInt(256),
        _rnd.nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildPillButton(
                    text: _isCircle ? 'Alterar para quadrado' : 'Alterar para círculo',
                    onPressed: _toggleShape,
                  ),
                  const SizedBox(width: 12),
                  _buildPillButton(
                    text: 'Cor aleatória',
                    onPressed: _randomizeColor,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: _color,
                  shape: _isCircle ? BoxShape.circle : BoxShape.rectangle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPillButton({required String text, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey[900],
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        shape: const StadiumBorder(),
        elevation: 0,
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
