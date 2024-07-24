import 'package:collab_notion_clone/Screens/HomePart/home_screen.dart';
import 'package:flutter/material.dart';

class NodeWidget extends StatelessWidget {
  final TreeNode node;
  final Function(TreeNode) onAddChild;

  const NodeWidget({super.key, required this.node, required this.onAddChild});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.folder),
            const SizedBox(width: 8),
            Text(
              node.title,
              style: Theme.of(context).textTheme.displaySmall,
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
            children: node.children
                .map((child) => NodeWidget(
                      node: child,
                      onAddChild: onAddChild,
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
                  onAddChild(TreeNode(newTitle));
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
