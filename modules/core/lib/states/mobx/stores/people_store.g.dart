// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PeopleStore on PeopleStoreBase, Store {
  late final _$peopleAtom =
      Atom(name: 'PeopleStoreBase.people', context: context);

  @override
  AllPeopleModel? get people {
    _$peopleAtom.reportRead();
    return super.people;
  }

  @override
  set people(AllPeopleModel? value) {
    _$peopleAtom.reportWrite(value, super.people, () {
      super.people = value;
    });
  }

  late final _$getPeopleAsyncAction =
      AsyncAction('PeopleStoreBase.getPeople', context: context);

  @override
  Future<void> getPeople() {
    return _$getPeopleAsyncAction.run(() => super.getPeople());
  }

  @override
  String toString() {
    return '''
people: ${people}
    ''';
  }
}
