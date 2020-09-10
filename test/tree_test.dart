import 'package:destination_lock/tree/node.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('tree data structure', () {
    final Node<String, String> root = Node(
      data: 'bruh, a string node',
      reference: 'root',
    );
    final Node<String, String> c = Node(
      data: 'hi, im c, i should have two children: a and b',
      reference: 'c',
    );
    c.insertChild(
      Node<String, String>(
        data: 'im a, hihi',
        reference: 'a',
      ),
    );
    c.insertChild(
      Node<String, String>(
        data: 'im b, muahaha',
        reference: 'b',
      ),
    );
    root.insertChild(c);

    final Node<String, String> d = Node(
      data: 'sup, im d, and i have no kids ;(',
      reference: 'd',
    );
    root.insertChild(d);

    final Node<String, String> f = Node(
      data: 'and im f, and heres my kid e',
      reference: 'f',
    );
    f.insertChild(
      Node<String, String>(
        data: 'hi, im e, wanna play with me?',
        reference: 'e',
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
  });
}
