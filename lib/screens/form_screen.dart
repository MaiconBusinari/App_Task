import 'package:flutter/material.dart';
import 'package:segundo_projeto/data/task_dao.dart';
import 'package:segundo_projeto/data/task_inherited.dart';

import '../components/task.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({required this.taskContext, Key? key}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool numberValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return true;
      }
      if (int.parse(value) < 1 || int.parse(value) > 5) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Nova Tarefa"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 910,
              width: 470,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3, color: Colors.black)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return 'Insira o nome da tarefa.';
                      }
                      return null;
                    },
                    controller: nameController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Nome",
                        fillColor: Colors.white70,
                        filled: true),
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (numberValidator(value)) {
                        return 'Insira uma dificuldade entre 1 e 5.';
                      }
                      return null;
                    },
                    controller: difficultyController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Diculdade",
                        fillColor: Colors.white70,
                        filled: true),
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return 'Insira o link da imagem.';
                      }
                      return null;
                    },
                    controller: imageController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.url,
                    onChanged: (text) {
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "imagem",
                        fillColor: Colors.white70,
                        filled: true),
                  ),
                  Container(
                    height: 100,
                    width: 75,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 2, color: Colors.red)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageController.text,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return Image.asset(
                            "assets/images/homer.jpg",
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await TaskDao().save(Task(
                            nome: nameController.text,
                            foto: imageController.text,
                            dificuldade: int.parse(difficultyController.text),
                            taskComplete: false,
                            nivel: 0,
                            apresentar: 0,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Criada nova tarefa')));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Adicionar tarefa"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
