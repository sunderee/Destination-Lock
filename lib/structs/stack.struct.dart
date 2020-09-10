import 'dart:collection';

/// Custom implementaton of the stack data structure
class DartStack<T> {
  /// Internal ListQueue instance storing the stack elements
  final ListQueue<T> _list = ListQueue();

  /// Retrieves all elements in the stack as an Iterable
  Iterable<T> getElements() => _list.toList(growable: false);

  /// Append an item to the top of the stack
  void push(T element) => _list.addLast(element);

  /// Append multiple items to the top of the stack
  void pushAll(Iterable<T> elements) => elements.forEach((e) => push(e));
}
