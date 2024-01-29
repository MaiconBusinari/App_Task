import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("Nova Tarefa"),
      ),
      body: Center(
        child: Container(
          height: 910,
          width: 470,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3, color: Colors.black)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: nameController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Nome",
                    fillColor: Colors.white70,
                    filled: true),
              ),
              TextFormField(
                controller: difficultyController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Diculdade",
                    fillColor: Colors.white70,
                    filled: true),
              ),
              TextFormField(
                controller: imageController,
                textAlign: TextAlign.center,
                onChanged: (text) {
                  setState(() {});
                },
                decoration: InputDecoration(
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
                    errorBuilder: (BuildContext context, Object exception,
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
                  onPressed: () {
                    print(nameController.text);
                    print(int.parse(difficultyController.text));
                    print(imageController.text);
                  },
                  child: const Text("Adicionar tarefa"))
            ],
          ),
        ),
      ),
    );
  }
}

//
// InputForm(descriptionInput: "Nome"),
// InputForm(descriptionInput: "Dificuldade",),
// InputForm(descriptionInput: "Link da Imagem",),]
//
// class InputForm extends StatefulWidget {
//   final String descriptionInput;
//
//   const InputForm({required this.descriptionInput,super.key});
//
//   @override
//   State<InputForm> createState() => _InputFormState();
// }
//
// class _InputFormState extends State<InputForm> {
//   TextEditingController nameController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: nameController,
//       textAlign: TextAlign.center,
//       decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           hintText: widget.descriptionInput,
//           fillColor: Colors.white70,
//           filled: true),
//     );
//   }
// }
