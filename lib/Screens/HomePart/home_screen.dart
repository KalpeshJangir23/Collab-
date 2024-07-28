// ignore_for_file: library_private_types_in_public_api

import 'package:collab_notion_clone/Screens/HomePart/model/tree_model.dart';
import 'package:collab_notion_clone/Screens/HomePart/widget/CustomScaffold.dart';
import 'package:collab_notion_clone/Screens/HomePart/widget/node.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = QuillController.basic();
  // final _editorFocusNode = FocusNode();
  // final _editorScrollController = ScrollController();
  // final _configurations = QuillEditorConfigurations(controller: QuillController.basic());
  List<TreeNode> roots = [];

  void _addRootNode() {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Root Node'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter node title'),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                final newTitle = controller.text;
                if (newTitle.isNotEmpty) {
                  setState(() {
                    roots.add(
                      TreeNode(
                        newTitle,
                        customScaffold(
                          newTitle,
                          context,
                          _controller,
                        ),
                      ),
                    );
                  });
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _addChildNode(TreeNode parent, TreeNode child) {
    setState(() {
      parent.children.add(child);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: roots
              .map((root) => NodeWidget(
                    node: root,
                    onAddChild: (child) => _addChildNode(root, child),
                    onTap: () {},
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRootNode,
        child: const Icon(Icons.add),
      ),
    );
  }
}
