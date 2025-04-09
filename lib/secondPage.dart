import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final Widget widget;

  Task({required this.id, required this.widget});
}

class secondPage extends StatefulWidget {
  const secondPage({super.key, required this.title});

  final String title;

  @override
  State<secondPage> createState() => _secondPage();
}

class _secondPage extends State<secondPage> {
  final List<Task> _tasks = [];

  void _createCard() {
    setState(() {
      String taskId = Uuid().v4();
      _tasks.add(
        Task(
          id: taskId,
          widget: Card(
            color: Colors.red,
            elevation: 10,
            margin: EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                style: TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black87),
                  hintText: "Enter Task",
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _createCard();
            },
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.black87,
        title: Text("Todo List", style: TextStyle(color: Colors.white)),
      ),
      body: _tasks.isEmpty
          ? Center(child: Text("No current tasks!"))
          : ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final item = _tasks[index];
          return Dismissible(
            key: Key(item.id),
            onDismissed: (direction) {
              setState(() {
                _tasks.removeAt(index);
              });
            },
            child: item.widget,
          );
        },
      ),
    );
  }
}
