import 'package:destination_lock/tree/node.dart';
import 'package:flutter/material.dart';

Map<String, dynamic> buildRouteMap<T, S>(Node<T, S> root) {
  Map<String, WidgetBuilder> routeMap = Map();
}

List<Map<String, dynamic>> generateChildRoutes<T, S>(Node<T, S> currentNode) {
  if (currentNode.children.isEmpty) {
    return [];
  } else {
    List<Map<dynamic, dynamic>> tmpList = [];
    currentNode.children.forEach((element) {
      tmpList.add({element.reference: element.data});
    });
    return tmpList;
  }
}