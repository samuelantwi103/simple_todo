import 'package:flutter/material.dart';
import 'package:simple_todo/components/dialog.dart';


void callBottomSheet({
  required BuildContext context,
  required String title,
  String? actionText,
  bool isCompleted = false,
  required Widget content,
  bool full = true,
  required ScrollController scrollController,

  // string
}) {
  showModalBottomSheet(
    showDragHandle: true,
    enableDrag: true,
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize:
            full ? 0.9 : 0.5, // Initial height is half of the screen
        minChildSize: full ? 0.9 : 0.3, // Minimum height of the bottom sheet
        maxChildSize: 0.9, // Maximum height when dragged
        expand: false,
        // Prevents expanding to full screen

        builder: (context, scrollController) {
          return CustomBottomSheet(
            title: title,
            content: content,
            full: full,
            scrollController: scrollController,
            actionText: actionText,
            onAction: () {
              // setState(() {
              //   isCompleted =true;
              // });
            },
          );
        },
      );
    },
  );
}

void callDialog({
  required BuildContext context,
   Widget? content,
  required String title,
  required VoidCallback onConfirm,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return PopupDialog(
          title: title,
          message: content,
          onConfirm: onConfirm,
          onCancel: () {
            Navigator.pop(context);
          });
    },
  );
}
