import 'package:freezed_annotation/freezed_annotation.dart';

import 'hash_utils.dart';

/// At the time of writing (8 Mar 2021) this class was built quickly as a
/// solution to freezed lacking a good solution for immutable collections.
/// It has not been tested (tasks have been created) and should be treated
/// with suspicion.
///
/// Performs a shallow copy of [from] so if T is immutable then
/// ImmutableList<T> is immutable but if T is mutable then
/// ImmutableList<T> is technically mutable (as the caller can potentially
/// mutate the objects that were passed in the original list)
///
/// copyAnd... makes a copy, mutates then creates the ImmutableList
/// - we use a private constructor that sets the member to the mutated list
///   without copying, for efficiency
///
/// Contract
/// - _list is never exposed
/// - the constructor parameter is cloned rather than assigned
///   - except in the private constructor
/// - the private constructor is only used after copying a list
/// - we never mutate _list
/// - functions with side effects clone the list and act on the clone
/// - functions that return an iterable that may allow side effects first clones
///   the list
///
class ImmutableList<T> implements Iterable<T> {
  final List<T> _list;

  ImmutableList() : _list = [];
  ImmutableList.fromList(List<T> list) : _list = [...list];
  ImmutableList.fromIterable(Iterable<T> iterable) : _list = [...iterable];

  ImmutableList._(List<T> list) : _list = list;

  ImmutableList<T> copyAndAdd(T item) => ImmutableList._([..._list, item]);
  ImmutableList<T> copyAndRemove(T item) =>
      ImmutableList._([..._list]..remove(item));
  ImmutableList<T> copyAndRemoveLast() =>
      ImmutableList._([..._list]..removeLast());

  factory ImmutableList.fromJson(List<T> json) => ImmutableList.fromList(json);

  @override
  int get length => _list.length;

  @override
  T get first => _list.first;

  T operator [](int i) => _list[i]; // get

  @override
  bool operator ==(o) =>
      o is ImmutableList && DeepCollectionEquality().equals(o, _list);

  @override
  int get hashCode => hashList(_list);

  @override
  bool any(bool Function(T element) test) =>
      _list.any((element) => test(element));

  @override
  Iterable<R> cast<R>() => [..._list].cast<R>();

  @override
  bool contains(Object? element) => _list.contains(element);

  @override
  T elementAt(int index) => _list.elementAt(index);

  @override
  bool every(bool Function(T element) test) =>
      _list.every((element) => test(element));

  @override
  Iterable<E> expand<E>(Iterable<E> Function(T element) f) =>
      [..._list].expand((element) => f(element));

  @override
  T firstWhere(bool Function(T element) test, {T Function()? orElse}) =>
      _list.firstWhere((element) => test(element), orElse: orElse);

  @override
  E fold<E>(E initialValue, E Function(E previousValue, T element) combine) =>
      [..._list].fold(initialValue, combine);

  @override
  Iterable<T> followedBy(Iterable<T> other) => [..._list].followedBy(other);

  @override
  void forEach(void Function(T element) f) =>
      _list.forEach((element) => f(element));

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  bool get isNotEmpty => _list.isNotEmpty;

  @override
  Iterator<T> get iterator => _list.iterator;

  @override
  String join([String separator = '']) => [..._list].join(separator);

  @override
  T get last => _list.last;

  @override
  T lastWhere(bool Function(T element) test, {T Function()? orElse}) =>
      _list.lastWhere((element) => test(element), orElse: orElse);

  @override
  Iterable<E> map<E>(E Function(T e) f) => [..._list].map((e) => f(e));

  @override
  T reduce(T Function(T value, T element) combine) =>
      [..._list].reduce(combine);

  @override
  T get single => _list.single;

  @override
  T singleWhere(bool Function(T element) test, {T Function()? orElse}) =>
      _list.singleWhere((element) => test(element), orElse: orElse);

  @override
  Iterable<T> skip(int count) => _list.skip(count);

  @override
  Iterable<T> skipWhile(bool Function(T value) test) =>
      _list.skipWhile((value) => test(value));

  @override
  Iterable<T> take(int count) => [..._list].take(count);

  @override
  Iterable<T> takeWhile(bool Function(T value) test) =>
      _list.takeWhile((value) => test(value));

  @override
  List<T> toList({bool growable = true}) => [..._list];

  @override
  Set<T> toSet() => {..._list};

  @override
  Iterable<T> where(bool Function(T element) test) =>
      [..._list].where((element) => test(element));

  @override
  Iterable<E> whereType<E>() => [..._list].whereType<E>();
}
