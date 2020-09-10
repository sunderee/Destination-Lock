import 'package:destination_lock/tree/models/node.dart';
import 'package:flutter/material.dart';

class RootRoute {
  final String path;
  final Widget widget;

  RootRoute({this.path = '/', this.widget});

  Node<Widget, String> toNode() => Node<Widget, String>(
        data: widget,
        reference: path,
      );
}
