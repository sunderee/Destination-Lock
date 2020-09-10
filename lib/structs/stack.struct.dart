import 'dart:collection';

class DartStack<T> {
  final ListQueue<T> _list = ListQueue();
  Iterable<T> getElements() => _list.toList(growable: false);

  void push(T element) => _list.addLast(element);
  void pushAll(Iterable<T> elements) => elements.forEach((e) => push(e));
}
