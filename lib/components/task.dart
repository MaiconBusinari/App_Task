import 'package:flutter/material.dart';
import 'difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Task({required this.nome,required this.foto,required this.dificuldade, super.key});

  int nivel = 0;
  double apresentar = 0;
  bool taskComplete = false;
  Color cor = Colors.blue;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  bool assetOrNetwork(){
    if(widget.foto.contains('http')){
      return false;
    }
    return true;
  }

  Image imageError(){
    return Image.asset(
      "assets/images/homer.jpg",
      fit: BoxFit.cover,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                color: widget.cor,
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
                        child: (assetOrNetwork()) ? Image.asset(
                          widget.foto,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                            return imageError();
                          },
                        ) : Image.network(
                          widget.foto,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                            return imageError();
                          },
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
                                if(widget.taskComplete == false){
                                  widget.nivel++;
                                  //Calculando a porcentagem concluida da tarefa
                                  widget.apresentar = ((widget.nivel/widget.dificuldade)/10 * 100)/1;
                                }
                                //Verificando nivel de atividade é igual a zero e escolhendo sua cor
                                if(widget.dificuldade == 0){
                                  widget.taskComplete = true;
                                  widget.cor = const Color(0xFFEA6991);
                                }
                                //Escolhenco cores baseado na dificuldade para quando a atividade foi concluida
                                if (widget.dificuldade != 0 &&
                                    //verificando se a terefa está completa
                                    (widget.nivel / widget.dificuldade) / 10 == 1) {
                                    var command = widget.dificuldade;
                                    switch (command){
                                      case 1:
                                        widget.cor = Colors.green;
                                        break;
                                      case 2:
                                        widget.cor = Colors.orange;
                                        break;
                                      case 3:
                                        widget.cor = Colors.yellow;
                                        break;
                                      case 4:
                                        widget.cor = Colors.red;
                                        break;
                                      case 5:
                                        widget.cor = Colors.brown;
                                        break;
                                    }
                                  widget.taskComplete = true;
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
                              ? (widget.nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.taskComplete? "Concluido": "Realizado: ${widget.apresentar.toStringAsFixed(1)}%",
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
