import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int dificuldade;

  const Difficulty({
    required this.dificuldade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Operadores ternarios verificando o nivel de dificuldade para exibir ao usuario a quantidade de estrelas corretas
        Icon(Icons.star,
            size: 15,
            color: (dificuldade >= 1) ? Colors.blue : Colors.black),
        Icon(Icons.star,
            size: 15,
            color: (dificuldade >= 2) ? Colors.blue : Colors.black),
        Icon(Icons.star,
            size: 15,
            color: (dificuldade >= 3) ? Colors.blue : Colors.black),
        Icon(Icons.star,
            size: 15,
            color: (dificuldade >= 4) ? Colors.blue : Colors.black),
        Icon(Icons.star,
            size: 15,
            color: (dificuldade >= 5) ? Colors.blue : Colors.black),
      ],
    );
  }
}