import 'package:flutter/material.dart';

class TreeNode {
  String title;
  List<TreeNode> children;
  Widget? scaffold;
  VoidCallback? onTap;

  TreeNode(this.title, this.scaffold, [List<TreeNode>? children, this.onTap]) : children = children ?? [];
}
