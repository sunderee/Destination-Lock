import 'package:destination_lock/destination_lock.dart';
import 'package:destination_lock/tree/models/regular_route.dart';
import 'package:destination_lock/tree/models/root_route.dart';
import 'package:flutter/material.dart';

/// Create an App class as a StatefulWidget
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

/// State
class _AppState extends State<App> {
  /// This is the routes map
  Map<String, WidgetBuilder> _routes;

  /// List of blocked routes
  List<String> _blockedRoutes;

  /// Declare the instance of [DestinationLock]
  DestinationLock _routeTree;

  @override
  void initState() {
    _blockedRoutes = [];

    // Populate the _routeTree with a route structure, similarly as you see below,
    // watch after the fact that you need to make sure (manually) to assign
    // proper relative paths to the children of RegularRoute, so as you can see
    // you have /c and then /c/a or /c/b
    _routeTree = DestinationLock(
      rootRoute: RootRoute(
        widget: Text('im a root widget'),
      ),
      regularRoutes: [
        RegularRoute(
          path: '/c',
          widget: Text('im c'),
          children: [
            RegularRoute(
              path: '/c/a',
              widget: Text('im a'),
            ),
            RegularRoute(
              path: '/c/b',
              widget: Text('im b'),
            ),
          ],
        ),
        RegularRoute(
          path: '/d',
          widget: Text('im d'),
        ),
      ],
      blockedRoutes: _blockedRoutes,
    );

    // Generate the map of routes
    _routes = _routeTree.convertToTreeStructure();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Simply use the _routes
      routes: _routes,

      // IMPORTANT: this is only for showcasing the use of the library to
      // modify the route map, if you have a root path, you don't need the
      // home widget declaration!!!
      home: Scaffold(
        body: Center(
          child: MaterialButton(
            child: Text('press to bloc /d'),
            onPressed: () {
              setState(() {
                // Add a path and regenerate the tree routes tree structure
                _blockedRoutes.add('/d');
                _routes = _routeTree.convertToTreeStructure();
              });
            },
          ),
        ),
      ),
    );
  }
}
