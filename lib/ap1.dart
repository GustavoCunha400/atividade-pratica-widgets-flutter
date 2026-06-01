import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _colorBox(Colors.red),
                    const SizedBox(width: 8),
                    _colorBox(Colors.green),
                    const SizedBox(width: 8),
                    _colorBox(Colors.blue),
                  ],
                ),

                const SizedBox(height: 16),
                Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 100,
                        color: Colors.purple,
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 50,
                        height: 100,
                        color: Colors.cyan,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.purple,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.cyan,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                Container(
                  color: Colors.grey[400],
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _colorBox(Color color) {
    return Container(width: 50, height: 50, color: color);
  }
}
