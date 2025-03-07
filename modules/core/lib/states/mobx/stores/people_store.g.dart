// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PeopleStore on PeopleStoreBase, Store {
  Computed<AllPeopleModel?>? _$peopleComputed;

  @override
  AllPeopleModel? get people =>
      (_$peopleComputed ??= Computed<AllPeopleModel?>(() => super.people,
              name: 'PeopleStoreBase.people'))
          .value;

  late final _$_peopleFutureAtom =
      Atom(name: 'PeopleStoreBase._peopleFuture', context: context);

  @override
  ObservableFuture<AllPeopleModel?> get _peopleFuture {
    _$_peopleFutureAtom.reportRead();
    return super._peopleFuture;
  }

  @override
  set _peopleFuture(ObservableFuture<AllPeopleModel?> value) {
    _$_peopleFutureAtom.reportWrite(value, super._peopleFuture, () {
      super._peopleFuture = value;
    });
  }

  late final _$getPeopleAsyncAction =
      AsyncAction('PeopleStoreBase.getPeople', context: context);

  @override
  Future<void> getPeople() {
    return _$getPeopleAsyncAction.run(() => super.getPeople());
  }

  late final _$refreshDataAsyncAction =
      AsyncAction('PeopleStoreBase.refreshData', context: context);

  @override
  Future<void> refreshData() {
    return _$refreshDataAsyncAction.run(() => super.refreshData());
  }

  @override
  String toString() {
    return '''
people: ${people}
    ''';
  }
}
