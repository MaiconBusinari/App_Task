
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
                  nome: "Aprendendo Dart",
                  foto: 'assets/images/coruja_1.jpg',
                  dificuldade: 0),
              Task(
                  nome: "Aprendendo Fluttter",
                  foto: 'assets/images/coruja_2.jpg',
                  dificuldade: 1),
              Task(
                  nome: "Aprendendo Node",
                  foto: 'assets/images/coruja_3.jpg',
                  dificuldade: 2),
              Task(
                  nome: "Aprendendo Dart",
                  foto: 'assets/images/coruja_1.jpg',
                  dificuldade: 3),
              Task(
                  nome: "Aprendendo Fluttter",
                  foto: 'assets/images/coruja_2.jpg',
                  dificuldade: 4),
              Task(
                  nome: "Aprendendo Node",
                  foto: 'assets/images/coruja_3.jpg',
                  dificuldade: 5),
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
