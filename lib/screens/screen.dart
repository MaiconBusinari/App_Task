import 'package:flutter/material.dart';
import 'package:segundo_projeto/data/task_dao.dart';
import 'package:segundo_projeto/screens/form_screen.dart';
import '../components/task.dart';
import '../data/task_inherited.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(onPressed: (){setState((){});}, icon: Icon(Icons.refresh))
        ],
        title: const Text("Tarefas"),
      ),
      body: Container(
        color: Colors.white10,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 75),
          child: FutureBuilder<List<Task>>(
              future: TaskDao().findAll(),
              builder: (context, snapshot) {
                List<Task>? items = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Center(
                      child: Column(
                        children: const [
                          CircularProgressIndicator(),
                          Text('Carregando')
                        ],
                      ),
                    );
                    break;
                  case ConnectionState.waiting:
                    return Center(
                      child: Column(
                        children: const [
                          CircularProgressIndicator(),
                          Text('Carregando')
                        ],
                      ),
                    );
                    break;
                  case ConnectionState.active:
                    return Center(
                      child: Column(
                        children: const [
                          CircularProgressIndicator(),
                          Text('Carregando')
                        ],
                      ),
                    );
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasData && items != null) {
                      if (items.isNotEmpty) {
                        return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Task task = items[index];
                              return task;
                            });
                      }
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.error_outline, size: 128),
                            Text(
                              "Não existe nenhuma tarefa.",
                              style: TextStyle(fontSize: 32),
                            )
                          ],
                        ),
                      );
                    }
                    return Text('Erro ao carregar terafas');
                    break;
                }
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then((value) => setState(() => {
              }));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
