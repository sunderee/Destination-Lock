import 'package:destination_lock/tree/models/node.dart';
import 'package:flutter/material.dart';

/// [RegularRoute] object is used to represent a route in the route map which is
/// not the home destination
class RegularRoute {
  /// String representation of a route, should include a slash, so for example
  /// when setting the path you would say `path: '/my_path'`
  final String path;

  /// Widget that the route is inflating, preferably should be some widget that
  /// extends [StatelessWidget] or [StatefulWidget]
  final Widget widget;

  /// Iterable object of child routes that the given route has access to
  Iterable<RegularRoute> children = Iterable.empty();

  /// The only two required parameters are [path] and [widget] while [children]
  /// defaults to [EmptyIterable] anyways
  RegularRoute({
    @required this.path,
    @required this.widget,
    this.children,
  });

  /// Convert the [RegularRoute] into [Node] which is important because the
  /// route generation operates with general tree data structure which has nodes,
  /// but the method should not be called by the developer unless you really
  /// want to have a [Node] object, for which there's no real reason, but hey,
  /// you do you...
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
