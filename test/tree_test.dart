import 'package:destination_lock/tree/destination_tree.dart';
import 'package:destination_lock/tree/models/node.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('tree data structure', () {
    final Node<Widget, String> root = Node(
      data: MaterialApp(),
      reference: 'root',
    );
    final Node<Widget, String> c = Node(
      data: Text('hi, im c, i should have two children: a and b'),
      reference: 'c',
    );
    c.insertChild(
      Node<Widget, String>(
        data: Text('im a, hihi'),
        reference: 'a',
      ),
    );
    c.insertChild(
      Node<Widget, String>(
        data: Text('im b, muahaha'),
        reference: 'b',
      ),
    );
    root.insertChild(c);

    final Node<Widget, String> d = Node(
      data: Text('sup, im d, and i have no kids ;('),
      reference: 'd',
    );
    root.insertChild(d);

    final Node<Widget, String> f = Node(
      data: Text('and im f, and heres my kid e'),
      reference: 'f',
    );
    f.insertChild(
      Node<Widget, String>(
        data: Text('hi, im e, wanna play with me?'),
        reference: 'e',
      )..insertChild(
          Node<Widget, String>(
            data: Text('hihi, im just here for the lolz'),
            reference: 'g',
          ),
        ),
    );
    root.insertChild(f);

    test('discover number of nodes', () {
      expect(1, 1);
    });

    test('determine if root has children', () {
      bool hasChildren = root.hasChildren();
      expect(hasChildren, true);
    });

    test('determine that node d has no children', () {
      bool hasChildren = d.hasChildren();
      expect(hasChildren, false);
    });

    test('generate route tree from root', () {
      Stopwatch stopwatch = Stopwatch()..start();
      final DestinationTree tree = DestinationTree();
      tree.buildRouteMap(root);

      Map<String, WidgetBuilder> routes = tree.getRouteMap();
      stopwatch.stop();
      print(routes.keys);
      print('Route generation took ${stopwatch.elapsedMilliseconds}ms');
      expect(routes.keys.length, 8);
    });
  });
}
