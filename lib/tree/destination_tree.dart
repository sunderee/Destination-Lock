import 'package:destination_lock/structs/pair.struct.dart';
import 'package:destination_lock/tree/node.dart';
import 'package:flutter/material.dart';

Map<String, dynamic> buildRouteMap(Node<String, Widget> root) {
  Map<String, WidgetBuilder> routeMap = Map();

  if (root.hasChildren()) {
    List<Pair<String, WidgetBuilder>> routesList = returnChildRoutes(root);
    routesList.forEach((route) {
      routeMap.putIfAbsent(route.first, () => route.second);
    });
    return routeMap;
  } else {
    return null;
  }
}

List<Pair<String, WidgetBuilder>> returnChildRoutes(Node<String, Widget> node) {
  if (node.hasChildren()) {
    List<Pair<String, WidgetBuilder>> tmpList = [];
    node.children.forEach((child) {
      tmpList.add(
        Pair<String, WidgetBuilder>(
            first: child.reference, second: (BuildContext cntx) => child.data),
      );
      if (child.hasChildren()) {
        child.children.forEach((innerChild) {
          returnChildRoutes(innerChild);
        });
      }
    });
    return tmpList;
  } else {
    return [];
  }
}
