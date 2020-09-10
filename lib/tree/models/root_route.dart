import 'package:destination_lock/tree/models/node.dart';
import 'package:flutter/material.dart';

class RootRoute {
  final String path;
  final Widget widget;

  RootRoute({
    @required this.widget,
    this.path = '/',
  });

  Node<Widget, String> toNode() => Node<Widget, String>(
        data: widget,
        reference: path,
      );
}
