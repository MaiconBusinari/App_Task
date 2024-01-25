import 'package:flutter/material.dart';
import 'difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  double apresentar = 0;
  bool taskComplete = false;
  Color cor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                color: cor,
                borderRadius: BorderRadius.circular(8)),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 75,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          widget.foto,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(
                                fontSize: 20, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Difficulty(dificuldade: widget.dificuldade),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                //Verificação se a tarefa foi concluida
                                if(taskComplete == false){
                                  nivel++;
                                  //Calculando a porcentagem concluida da tarefa
                                  apresentar = ((nivel/widget.dificuldade)/10 * 100)/1;
                                }
                                //Verificando nivel de atividade é igual a zero e escolhendo sua cor
                                if(widget.dificuldade == 0){
                                  taskComplete = true;
                                  cor = const Color(0xFFEA6991);
                                }
                                //Escolhenco cores baseado na dificuldade para quando a atividade foi concluida
                                if (widget.dificuldade != 0 &&
                                    (nivel / widget.dificuldade) / 10 == 1) {
                                    var command = widget.dificuldade;
                                    switch (command){
                                      case 1:
                                        cor = Colors.green;
                                        break;
                                      case 2:
                                        cor = Colors.orange;
                                        break;
                                      case 3:
                                        cor = Colors.yellow;
                                        break;
                                      case 4:
                                        cor = Colors.red;
                                        break;
                                      case 5:
                                        cor = Colors.brown;
                                        break;
                                    }
                                  taskComplete = true;
                                }
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  "UP",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 300,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        taskComplete? "Concluido": "Realizado: ${apresentar.toStringAsFixed(1)}%",
                        style: const TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
