import 'package:flutter/material.dart';
import 'package:simple_todo/components/card.dart';
import 'package:simple_todo/services/api.dart';
import 'package:simple_todo/services/callback.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Map<String, dynamic>> todoData = [];

class _HomePageState extends State<HomePage> {
  TextEditingController editTodoController = TextEditingController();
  TextEditingController addTodoController = TextEditingController();

  @override
  void initState(){
    super.initState();
    fetchToDos(); // Call the data fetching function when the widget is initialized
  }

    Future<void> fetchToDos() async {
    try {
      List<Map<String, dynamic>> todos = await getToDos(); // Fetch data from backend
      setState(() {
        todoData = todos; // Update state with the retrieved data
      });
    } catch (e) {
      // Handle any errors here
      debugPrint('Error fetching TODOs: $e');
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text("Simple TODO"),
      ),
      body: (todoData.isNotEmpty)? Center(
        child: ListView.separated(
          itemCount: todoData.length,
          padding: const EdgeInsets.fromLTRB(5, 10, 5, 50),
          itemBuilder: (context, index) {
            Map<String, dynamic> data = todoData[index];
            return TodoCard(
              title: '${data['description']}',
              onDelete: () {
                callDialog(
                  context: context,
                  title: "Delete TODO",
                  onConfirm: () async{
                    Navigator.pop(context);
                    debugPrint(data["id"].runtimeType.toString());
                    await deleteToDo(data["id"]);
                    
                    final tasks = await getToDos();
                    setState(() {
                      todoData = tasks;
                    });
                    
                    
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
      ): const Center(child:Text("Empty list")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          callDialog(
              context: context,
              title: "Add TODO",
              onConfirm: () async {
                String message = addTodoController.text.trim();
                try{
                  await createToDo({'description': message});
                  final tasks = await getToDos();
                    setState(() {
                      todoData = tasks;
                    });
                }catch(e){
                  debugPrint("Error: $e");
                }
                
                ScaffoldMessenger.of(context).showSnackBar(  SnackBar( content: Text('TODO Created: $message !')));
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
