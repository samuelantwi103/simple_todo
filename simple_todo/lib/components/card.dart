// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodoCard extends StatefulWidget {
  String title;
  void Function()? onDelete;
  void Function()? onEdit;
  TodoCard({
    super.key,
    required this.title,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsets.all(4),
                minTileHeight: 50,
                title: Text(widget.title),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: widget.onEdit, icon: const Icon(Icons.edit_outlined)),
                IconButton(
                    onPressed: widget.onDelete,
                    icon: const Icon(Icons.delete_outline_rounded)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
