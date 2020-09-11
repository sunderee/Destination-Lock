# destination_lock

Lock/unlock destinations that your application can reach. This is done by modifying the Map object representing routes in the `MaterialApp` widget.

Using the general tree data structure, route generation takes place at the root node and uses recursive DFT (post-order traversal) in order to build a map object of routes. Class `DestinationLock` acts as a wrapper around the tree data structure using a declarative syntax that we, Flutter developers, prefer when building UI. If it's good for UI, it'll be good for route declaration.

## Installation and usage

Check the [installation section](https://pub.dev/packages/destination_lock/install) for installation and the [example](https://pub.dev/packages/destination_lock/example) as an overview.

When creating an instance of the `DestinationLock`, you need to provide the `RootRoute` and an array of `RegularRoute`. The root route, or the home route, will default to the path `/`, unless otherwise specified. Regular routes can define their children, but the path naming convention needs to be considered:

```dart
// In order to create routes
//
// first_route/
//  first_route/subroute
//  first_route/second_subroute
//
// you need to make a declaration similar to one below
final regularRoutes = [
  RegularRoute(
    path: '/first_route',
    widget: null, // widget this route inflates
    children: [
      RegularRoute(
        path: '/first_route/subroute',
        widget: null, // widget this route inflates,
      ),
      RegularRoute(
        path: '/first_route/second_subroute',
        widget: null, // widget this route inflates
      )
    ],
  )
];
```

## License

Project is licensed under the MIT license.

## Contributions

Code is hosted on GitHub, but the main development is conducted on a private GitLab repository for personal purposes. I will maintain and improve the library based on personal needs.
