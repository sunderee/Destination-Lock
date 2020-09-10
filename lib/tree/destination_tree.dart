import 'package:destination_lock/structs/stack.struct.dart';
import 'package:destination_lock/tree/node.dart';
import 'package:flutter/material.dart';

class DestinationTree {
  final Map<String, WidgetBuilder> _routeMap = Map();

  Map<String, WidgetBuilder> getRouteMap() => _routeMap;

  void buildRouteMap(Node<Widget, String> root) {
    DartStack<Node<Widget, String>> routesStack = _createNodeStack(root);
    routesStack.getElements().forEach((element) {
      _routeMap.putIfAbsent(
        element.reference,
        () => (BuildContext cntx) => element.data,
      );
    });
  }

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
}
