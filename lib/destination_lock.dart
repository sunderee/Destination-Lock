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
  final List<RegularRoute> regularRoutes;

  /// Collection of blocked routes
  final List<String> blockedRoutes;

  /// Create the [DestinationLock] via the [RootRoute] and collection of
  /// [RegularRoute] objects. Both [rootRoute] and [regularRoutes] paramters are
  /// required, but you also have the [blockedRoutes] one which defines routes
  /// that are supposed to be blocked
  DestinationLock(
      {@required this.rootRoute,
      @required this.regularRoutes,
      this.blockedRoutes}) {
    if (blockedRoutes != null && blockedRoutes.isNotEmpty) {
      recomputeTree(blockedRoutes);
    }
  }

  /// Export the routes into a `Map<String, WidgetBuilder>` object which is used
  /// by the [MaterialApp] in order to create routes
  Map<String, WidgetBuilder> convertToTreeStructure() {
    Node<Widget, String> root = rootRoute.toNode();
    regularRoutes.forEach((route) {
      root.insertChild(route.toNode());
    });

    return buildRouteMap(root);
  }

  /// Recomputes tree structure based on the blocked routes predicament: you're
  /// only supposed to remove routes whose path contains one of the blocked
  /// path mentions, but that means that the structure of paths (this is, their
  /// parent-child relative paths) need to follow a strict naming convention
  void recomputeTree(List<String> blockedRoutes) {
    regularRoutes.removeWhere((route) {
      for (int i = 0; i < blockedRoutes.length; i++) {
        return route.path.contains(blockedRoutes[i]);
      }
      return false;
    });
  }
}
