class TreeNode {
  String title;
  List<TreeNode> children;

  TreeNode(this.title, [List<TreeNode>? children]) : children = children ?? [];
}
