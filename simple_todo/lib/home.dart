import 'package:flutter/material.dart';
import 'package:simple_todo/components/card.dart';
import 'package:simple_todo/services/callback.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Map<String, dynamic>> todoData = [
  {
    "id": 1,
    "title": "Buy groceries",
    "description": "Milk, Eggs, Bread, and Butter",
    "dueDate": "2024-10-10",
    "isCompleted": false,
    "priority": "high",
    "category": "Personal",
    "creationDate": "2024-10-07"
  },
  {
    "id": 2,
    "title": "Finish Flutter project",
    "description": "Work on the todo app feature",
    "dueDate": "2024-10-15",
    "isCompleted": false,
    "priority": "medium",
    "category": "Work",
    "creationDate": "2024-10-07"
  },
  {
    "id": 3,
    "title": "Read a book",
    "description": "Read 'Atomic Habits' for 30 minutes",
    "dueDate": "2024-10-12",
    "isCompleted": false,
    "priority": "low",
    "category": "Personal",
    "creationDate": "2024-10-07"
  }
];

class _HomePageState extends State<HomePage> {
  TextEditingController editTodoController = TextEditingController();
  TextEditingController addTodoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text("Simple TODO"),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: todoData.length,
          padding: const EdgeInsets.fromLTRB(5, 10, 5, 50),
          itemBuilder: (context, index) {
            Map<String, dynamic> data = todoData[index];
            return TodoCard(
              title: '${data['title']}',
              onDelete: () {
                callDialog(
                  context: context,
                  title: "Delete TODO",
                  onConfirm: () {
                    Navigator.pop(context);

                   ScaffoldMessenger.of(context).showSnackBar(const  SnackBar( content: Text('TODO deleted!')));
                  },
                );
              },
              onEdit: () {
                callDialog(
                  context: context,
                  title: "Edit TODO",
                  content: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    minLines: 1,
                    maxLines: 2,
                    controller: editTodoController,
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                          ),
                      filled: true,
                    ),
                  ),
                  onConfirm: () {
                    ScaffoldMessenger.of(context).showSnackBar(  SnackBar( content: Text('TODO Updated: ${editTodoController.text} !')));
                    editTodoController.clear();
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          callDialog(
              context: context,
              title: "Add TODO",
              onConfirm: () {
                ScaffoldMessenger.of(context).showSnackBar(  SnackBar( content: Text('TODO Created: ${addTodoController.text} !')));
                    addTodoController.clear();
                Navigator.pop(context);
              },
              content: TextFormField(
               
                autovalidateMode: AutovalidateMode.onUserInteraction,
                minLines: 1,
                maxLines: 2,
                controller: addTodoController,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                      ),
                  filled: true,
                ),
              ));
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
