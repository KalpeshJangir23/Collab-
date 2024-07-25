import 'package:collab_notion_clone/Screens/HomePart/model/tree_model.dart';
import 'package:collab_notion_clone/Screens/HomePart/widget/CustomScaffold.dart';
import 'package:flutter/material.dart';

class NodeWidget extends StatelessWidget {
  final TreeNode node;
  final Function(TreeNode) onAddChild;
  final VoidCallback onTap;

  const NodeWidget({super.key, required this.node, required this.onAddChild, required this.onTap});

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
                if (node.scaffold != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => node.scaffold!),
                  );
                }
              },
              child: Text(
                node.title,
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
            children: node.children
                .map((child) => NodeWidget(
                      node: child,
                      onAddChild: onAddChild,
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
                  onAddChild(TreeNode(
                    newTitle,
                    customScafflod(newTitle),
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
