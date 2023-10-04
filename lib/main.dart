import "package:flutter/material.dart";
import "package:to_do_list/task_list.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
      ),
      body: TaskInputWidget(),
    );
  }
}

class TaskInputWidget extends StatefulWidget {
  const TaskInputWidget({super.key});

  @override
  State<TaskInputWidget> createState() => _TaskInputWidgetState();
}

class _TaskInputWidgetState extends State<TaskInputWidget> {
  TextEditingController _taskController = TextEditingController();
  List<String> _tasks = [];
  void _addTask() {
    setState(() {
      _tasks.add(_taskController.text);
      _taskController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _taskController,
          decoration: InputDecoration(labelText: 'Task'),
        ),
        ElevatedButton(
          onPressed: _addTask,
          child: Text('Add Task'),
        ),
        ElevatedButton(
          onPressed: () {
            _navigatetoTaskListPage(context, _tasks);
          },
          child: Text('View Tasks'),
        )
      ],
    );
  }
}

void _navigatetoTaskListPage(BuildContext context, List<String> tasks) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TaskListPage(tasks)),
  );
}
