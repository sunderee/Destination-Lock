import 'package:destination_lock/tree/models/node.dart';
import 'package:flutter/material.dart';

class RegularRoute {
  final String path;
  final Widget widget;
  Iterable<RegularRoute> children = Iterable.empty();

  RegularRoute({
    @required this.path,
    @required this.widget,
    this.children,
  });

  Node<Widget, String> toNode() {
    Node<Widget, String> node = Node(
      data: widget,
      reference: path,
    );
    if (children != null && children.isNotEmpty) {
      children.forEach((child) {
        node.insertChild(Node<Widget, String>(
          data: child.widget,
          reference: child.path,
        ));
        if (child.children != null && child.children.isNotEmpty) {
          child.children.forEach((innerChild) {
            node.insertChild(innerChild.toNode());
          });
        }
      });
    }
    return node;
  }
}
