library destination_lock;

import 'package:destination_lock/tree/models/node.dart';
import 'package:destination_lock/tree/models/regular_route.dart';
import 'package:destination_lock/tree/models/root_route.dart';
import 'package:destination_lock/tree/tree_builder.dart';
import 'package:flutter/material.dart';

/// MAIN CLASS: this is what the user should access. [DestinationLock] library
/// is a wrapper for the underlying mechanism of dynamic route generation
class DestinationLock extends MaterialApp {
  /// The root route, aka, the home route
  final RootRoute rootRoute;

  /// Collection of regular routes
  final Iterable<RegularRoute> regularRoutes;

  /// Create the [DestinationLock] via the [RootRoute] and collection of
  /// [RegularRoute]s
  DestinationLock({@required this.rootRoute, @required this.regularRoutes});

  /// Export the routes into a `Map<String, WidgetBuilder>` object which is used
  /// by the [MaterialApp] in order to create routes
  Map<String, WidgetBuilder> convertToTreeStructure() {
    Node<Widget, String> root = rootRoute.toNode();
    regularRoutes.forEach((route) {
      root.insertChild(route.toNode());
    });

    return buildRouteMap(root);
  }
}
