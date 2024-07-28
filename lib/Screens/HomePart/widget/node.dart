import 'package:collab_notion_clone/Screens/HomePart/model/tree_model.dart';
import 'package:collab_notion_clone/Screens/HomePart/widget/CustomScaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class NodeWidget extends StatefulWidget {
  final TreeNode node;
  final Function(TreeNode) onAddChild;
  final VoidCallback onTap;

  const NodeWidget({super.key, required this.node, required this.onAddChild, required this.onTap});

  @override
  State<NodeWidget> createState() => _NodeWidgetState();
}

class _NodeWidgetState extends State<NodeWidget> {
  final _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.folder),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                if (widget.node.scaffold != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => widget.node.scaffold!),
                  );
                }
              },
              child: Text(
                widget.node.title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                _showAddChildDialog(context);
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.node.children
                .map((child) => NodeWidget(
                      node: child,
                      onAddChild: widget.onAddChild,
                      onTap: () {},
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  void _showAddChildDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Child Node'),
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
                  widget.onAddChild(TreeNode(
                    newTitle,
                    customScaffold(
                      newTitle,
                      context,
                      _controller,
                    ),
                  ));
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
