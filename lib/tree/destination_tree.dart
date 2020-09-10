import 'package:destination_lock/structs/stack.struct.dart';
import 'package:destination_lock/tree/node.dart';
import 'package:flutter/material.dart';

Map<String, dynamic> buildRouteMap(Node<Widget, String> root) {
  Map<String, WidgetBuilder> routeMap = Map();
  DartStack<Node<Widget, String>> routesStack = createNodeStack(root);
  routesStack.getElements().forEach((element) {
    routeMap.putIfAbsent(
      element.reference,
      () => (BuildContext cntx) => element.data,
    );
  });
  return routeMap;
}

DartStack<Node> createNodeStack(Node<Widget, String> root) {
  DartStack<Node<Widget, String>> stack = DartStack();
  stack.push(root);
  if (root.hasChildren()) {
    root.children.forEach((child) {
      stack.push(child as Node<Widget, String>);
      if (child.hasChildren()) {
        stack.pushAll(
          createNodeStack(child as Node<Widget, String>).getElements(),
        );
      }
    });
  }
  return stack;
}
