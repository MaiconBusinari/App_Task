import 'package:flutter/material.dart';
import 'package:segundo_projeto/data/task_inherited.dart';
import 'package:segundo_projeto/screens/screen.dart';

import 'screens/form_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Segundo projeto',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: "/login",
      routes: {
        '/login': (context) => TaskInherited(child: Screen()),
        '/formScreen': (context) => FormScreen(taskContext: context)
      },
    );
  }
}



//MaterialApp -> Scaffold -> 2 Estruturas padrão
//title -> Titulo na parte superior
//body -> Tudo dentro do aplicativo
