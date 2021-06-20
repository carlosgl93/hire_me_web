import 'package:flutter/material.dart';
import 'package:hire_me/models/todoList/todos.dart';

class TodoList extends StatelessWidget {
  final List<Task> tasks = [
    Task(
        title: 'Learn Flutter',
        description:
            'You want to build cool apps and websites with just one code? Then JUST DO IT!',
        date: DateTime.now()),
    Task(
        title: 'Workout',
        description:
            'Exercise is the key to have the upper hand, its underrated.',
        date: DateTime.now()),
    Task(
        title: 'Smile',
        description:
            'We are all here trying our best to make our days the most enjoyable possible.',
        date: DateTime.now()),
  ];

  TodoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        children: [
          ...tasks.map((task) {
            return Card(
              child: Container(
                child: Column(
                  children: [
                    Text(task.title),
                    Text(task.description),
                  ],
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
