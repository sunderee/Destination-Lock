import 'package:flutter/material.dart';

/// Slightly modified version of a typical tree node implementation which stores
/// two pices of data: the actual data we're storing inside it as well as the
/// reference, (think of it as an unique ID of the node). We need to provide types
/// for both data and reference respectively
class Node<T, S> {
  /// Data that the node is storing
  final T data;

  /// Node's reference
  final S reference;

  /// List of node's children, which are other nodes
  List<Node> children = [];

  /// Create node instance from data and reference, both parameters are required
  Node({@required this.data, @required this.reference});

  /// Returns `true` if the node has any children nodes
  bool hasChildren() => children.isNotEmpty;

  /// Insert a child node
  void insertChild(Node child) => children.add(child);
}
