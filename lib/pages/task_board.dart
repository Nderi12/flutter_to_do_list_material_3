import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/database/task_database.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/to_do_tile.dart';

class TaskBoard extends StatefulWidget {
  const TaskBoard({super.key});

  @override
  State<TaskBoard> createState() => _TaskBoardState();
}

class _TaskBoardState extends State<TaskBoard> {
  final taskBox = Hive.box('task_box');

  TaskDatabase db = TaskDatabase();

  final _controller = TextEditingController();

  @override
  void initState() {
    // create data on first time opening app
    if (taskBox.get('TASKLIST') == null) {
      db.createInitialData();
    } else {
      // already exists data
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.taskList[index]['completed'] = !db.taskList[index]['completed'];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.taskList.add({'name': _controller.text, 'completed': false});
    });
    db.updateData();
    Navigator.of(context).pop();
  }

  void addNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.taskList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text(
          'MATERIAL 3 TO DO LIST',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(.3),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewTask(),
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.taskList.length,
          itemBuilder: (context, index) {
            final task = db.taskList[index];
            return ToDoTile(
              name: task['name'],
              completed: task['completed'],
              onChanged: (value) => checkBoxChange(value, index),
              deleteFn: (context) => deleteTask(index),
            );
          }),
    );
  }
}
