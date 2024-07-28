// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class NoteDisplay extends StatelessWidget {
  final String content;

  const NoteDisplay({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Preview'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("vsdf"),
            Expanded(child: MarkdownBody(data: content)),
          ],
        ),
      ),
    );
  }
}
