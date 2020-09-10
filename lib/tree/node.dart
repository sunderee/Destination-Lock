class Node<T, S> {
  final T data;
  final S reference;
  List<Node> children = [];

  Node({this.data, this.reference});

  int numberOfChildren() => children.length;

  void insertChild(Node child) => children.add(child);

  String printTree() {
    String currentNode = 'Current node data: $data\nFinding children...\n';
    if (children.isNotEmpty) {
      children.forEach((child) {
        currentNode += child.printTree();
      });
    } else {
      currentNode += 'No children found!\n';
    }
    currentNode += '\n';
    return currentNode;
  }
}
