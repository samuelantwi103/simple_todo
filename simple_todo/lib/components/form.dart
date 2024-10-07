import 'package:flutter/material.dart';



// Add Task Form UI
class AddTaskForm extends StatefulWidget {
  final GlobalKey<FormState> formKey; // Pass the form key from parent
  // Controllers for the form fields
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  const AddTaskForm({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.descriptionController,
  });

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey, // Use the passed form key
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // First Name Field
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              minLines: 1,
              maxLines: 2,
              controller: widget.titleController,
              decoration:const InputDecoration(
                alignLabelWithHint: true,
                labelText: 'Title',
                border: OutlineInputBorder(),
                filled: true,
                // fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 10),

            // Middle Name Field
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              minLines: 3,
              maxLines: 5,
              controller: widget.descriptionController,
              decoration:const InputDecoration(
                alignLabelWithHint: true,
                labelText: 'Description',
                border: OutlineInputBorder(),
                filled: true,
                // fillColor: Colors.grey[200],
              ),
            ),
           const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

