library destination_lock;

import 'package:destination_lock/tree/models/node.dart';
import 'package:destination_lock/tree/models/regular_route.dart';
import 'package:destination_lock/tree/models/root_route.dart';
import 'package:destination_lock/tree/tree_builder.dart';
import 'package:flutter/material.dart';

class DestinationLock extends MaterialApp {
  final RootRoute rootRoute;
  final Iterable<RegularRoute> regularRoutes;

  DestinationLock({this.rootRoute, this.regularRoutes});

  Map<String, WidgetBuilder> convertToTreeStructure() {
    Node<Widget, String> root = rootRoute.toNode();
    regularRoutes.forEach((route) {
      root.insertChild(route.toNode());
    });

    final DestinationTree destinationTree = DestinationTree();
    destinationTree.buildRouteMap(root);
    return destinationTree.getRouteMap();
  }
}
