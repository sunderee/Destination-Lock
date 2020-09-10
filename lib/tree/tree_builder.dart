import 'package:destination_lock/structs/stack.struct.dart';
import 'package:destination_lock/tree/models/node.dart';
import 'package:flutter/material.dart';

/// This method builds the route map from the input root [Node] of the route
/// tree generated beforehand
Map<String, WidgetBuilder> buildRouteMap(Node<Widget, String> root) {
  final Map<String, WidgetBuilder> routeMap = Map();
  DartStack<Node<Widget, String>> routesStack = _createNodeStack(root);
  routesStack.getElements().forEach((element) {
    routeMap.putIfAbsent(
      element.reference,
      () => (BuildContext cntx) => element.data,
    );
  });
  return routeMap;
}

/// Private method that is used to build the stack of nodes representing a
/// single-dimensional representiation of the tree data structure, with the
/// correct ordering
DartStack<Node> _createNodeStack(Node<Widget, String> root) {
  DartStack<Node<Widget, String>> stack = DartStack();
  stack.push(root);
  if (root.hasChildren()) {
    root.children.forEach((child) {
      stack.push(child as Node<Widget, String>);
      if (child.hasChildren()) {
        stack.pushAll(
          _createNodeStack(child as Node<Widget, String>).getElements(),
        );
      }
    });
  }
  return stack;
}
