import "package:flutter/material.dart";

class TaskListPage extends StatelessWidget {
  final List<String> tasks;
  TaskListPage(this.tasks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Task List'),
        ),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tasks[index]),
            );
          },
        ));
  }
}
