import 'package:destination_lock/tree/models/node.dart';
import 'package:flutter/material.dart';

class RouteTree {
  final Node<Widget, String> home;
  final List<Node<Widget, String>> routes;

  RouteTree({this.home, this.routes}) {}

  void convertToTree() {}
}
