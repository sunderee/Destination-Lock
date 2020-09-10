class Node<T, S> {
  final T data;
  final S reference;
  List<Node> children = [];

  Node({this.data, this.reference});

  bool hasChildren() => children.isNotEmpty;

  void insertChild(Node child) => children.add(child);
}
