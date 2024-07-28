// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:collab_notion_clone/Screens/HomePart/widget/notesDisplay.dart';

Widget customScaffold(
  String title,
  BuildContext context,
  quill.QuillController controller,
  // // quill.QuillEditorConfigurations configurations,
  // ScrollController scrollController,
  // FocusNode focusNode,
) {
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: Column(
      children: [
        quill.QuillToolbar.simple(
          configurations: quill.QuillSimpleToolbarConfigurations(controller: controller),
        ),
        Expanded(
          child: quill.QuillEditor.basic(
            configurations: quill.QuillEditorConfigurations(controller: controller),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (context.mounted) {
              // Check if the context is still valid
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteDisplay(
                    content: controller.document.toPlainText(),
                  ),
                ),
              );
            }
          },
          child: const Text('Preview Note'),
        ),
      ],
    ),
  );
}
