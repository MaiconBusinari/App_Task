
import 'package:flutter/material.dart';
import 'package:segundo_projeto/components/task.dart';


class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("Segundo projeto"),
      ),
      body: Container(
        color: Colors.white10,
        child: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: ListView(
            children: const [
              Task(
                  "Aprendendo Dart",
                  'assets/images/coruja_1.jpg',
                  0),
              Task(
                  "Aprendendo Fluttter",
                  'assets/images/coruja_2.jpg',
                  1),
              Task(
                  "Aprendendo Node",
                  'assets/images/coruja_3.jpg',
                  2),
              Task(
                  "Aprendendo Dart",
                  'assets/images/coruja_1.jpg',
                  3),
              Task(
                  "Aprendendo Fluttter",
                  'assets/images/coruja_2.jpg',
                  4),
              Task(
                  "Aprendendo Node",
                  'assets/images/coruja_3.jpg',
                  5),
              SizedBox( height: 80)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
