import 'package:destination_lock/tree/models/node.dart';
import 'package:flutter/material.dart';

/// This class defines a home route
class RootRoute {
  /// Home route's path, which defaults to a 'root-like' path, this is `'/'`
  final String path;

  /// Widget that the home route inflates, should preferably be either a widget
  /// that extends [StatelessWidget] or [StatefulWidget]
  final Widget widget;

  /// We require the [widget] parameter, while the [path] is set to default to
  /// a typical root-like path
  RootRoute({
    @required this.widget,
    this.path = '/',
  });

  /// Converts into [Node] object
  Node<Widget, String> toNode() => Node<Widget, String>(
        data: widget,
        reference: path,
      );
}
