import 'package:segundo_projeto/data/database.dart';
import 'package:sqflite/sqflite.dart';

import '../components/task.dart';

class TaskDao {
  static String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXTE, '
      '$_difficulty INTEGER, '
      '$_image TEXT, '
      '$_nivel INTEGER, '
      '$_apresentar REAL, '
      '$_taskComplete INTEGER)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';
  static const String _nivel = 'nivel';
  static const String _apresentar = 'apresentar';
  static const String _taskComplete = 'taskComplete';

  /*Incluindo/atualizando uma terafa no banco de dados*/
  save(Task tarefa) async {
    print("Estamos iniciando o save");
    final Database db = await getDatabase();
    var taskExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (taskExists.isEmpty) {
      print("A tarefa não existia.");
      return await db.insert(_tablename, taskMap);
    }
    print("A terefa já existia, vai ser atualizada");
    return await db.update(_tablename, taskMap,
        where: '$_name = ?', whereArgs: [tarefa.nome]);
  }

  /*Buscando todos os dados de tarefas no banco de dados*/
  Future<List<Task>> findAll() async {
    print("Estamos buscando todas as tarefas no banco de dados.");
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resultMapTask = await db.query(_tablename);
    print("Maps das tarefas encontradas no banco de dados: $resultMapTask");
    return toList(resultMapTask);
  }

  /*Buscando uma tarefa especifica no banco de dados pelo nome*/
  Future<List<Task>> find(String nameTask) async {
    print('Estamos buscando uma terefa especifica no banco de dados');
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resultMapTask =
        await db.query(_tablename, where: '$_name = ?', whereArgs: [nameTask]);
    print(
        "Maps das tarefa Especifica encontrada no banco de dados: $resultMapTask");
    return toList(resultMapTask);
  }

  /*Apagando uma terefa especifica pelo nome*/
  delete(String nomeDaTarefa) async {
    print("Deletando tarefa");
    final Database db = await getDatabase();
    db.delete(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
    print("Tarefa deletada");
    return null;
  }

  /*Convertendo Maps obtidos no banco de dados para tarefas*/
  List<Task> toList(List<Map<String, dynamic>> listTask) {
    print('Convertendo as tarefas em Map obtidas para uma Lista');
    final List<Task> tasks = [];
    for (Map<String, dynamic> linha in listTask) {
      final Task task = Task(
        nome: linha[_name],
        foto: 'assets/images/coruja_3.jpg',
        dificuldade: linha[_difficulty],
        apresentar: linha[_apresentar],
        nivel: linha[_nivel],
        taskComplete: linha[_taskComplete] != 0
      );
      tasks.add(task);
    }
    return tasks;
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('Convertendo tarafa para Map');

    final Map<String, dynamic> map = Map();
    map[_name] = tarefa.nome;
    map[_image] = tarefa.foto;
    map[_difficulty] = tarefa.dificuldade;
    map[_apresentar] = tarefa.apresentar;
    map[_nivel] = tarefa.nivel;
    map[_taskComplete] = tarefa.taskComplete ? 1 : 0;

    return map;
  }
}
