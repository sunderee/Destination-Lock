import 'package:destination_lock/destination_lock.dart';
import 'package:destination_lock/tree/models/regular_route.dart';
import 'package:destination_lock/tree/models/root_route.dart';

List<String> _blockedRoutes = [];
DestinationLock routeTree = DestinationLock(
  rootRoute: RootRoute(
    widget: null,
  ),
  regularRoutes: [
    RegularRoute(
      path: '/c',
      widget: null,
      children: [
        RegularRoute(
          path: '/c/a',
          widget: null,
        ),
        RegularRoute(
          path: '/c/b',
          widget: null,
        ),
      ],
    ),
    RegularRoute(
      path: '/d',
      widget: null,
    ),
  ],
  blockedRoutes: _blockedRoutes,
);

final map = routeTree.convertToTreeStructure();
