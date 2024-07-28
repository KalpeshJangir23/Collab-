// ignore_for_file: file_names

import 'package:collab_notion_clone/Screens/HomePart/widget/CustomScaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key, required this.title});
  final String title;

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  final _controller = QuillController.basic();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return customScaffold(
      widget.title,
      context,
      _controller,
    );
  }
}
