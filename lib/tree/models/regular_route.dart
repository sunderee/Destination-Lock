import 'package:destination_lock/tree/models/node.dart';
import 'package:flutter/material.dart';

class RegularRoute {
  final String path;
  final Widget widget;
  final Iterable<RegularRoute> children;

  RegularRoute({this.path, this.widget, this.children});

  Node<Widget, String> toNode() {
    Node<Widget, String> node = Node(
      data: widget,
      reference: path,
    );
    if (children.isNotEmpty) {
      children.forEach((child) {
        node.insertChild(Node<Widget, String>(
          data: child.widget,
          reference: child.path,
        ));
      });
    }
    return node;
  }
}
