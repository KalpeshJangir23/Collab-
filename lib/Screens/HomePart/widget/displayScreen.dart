import 'package:collab_notion_clone/Screens/HomePart/widget/CustomScaffold.dart';
import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return customScafflod(title);
  }
}
