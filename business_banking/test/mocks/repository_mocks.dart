// @dart=2.9
import 'dart:async';

import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:mockito/mockito.dart';

class MockRepository extends Mock implements Repository {
  static var _entity;
  static var _scope;

  MockRepository._internal();

  factory MockRepository() {
    final mockRepository = MockRepository._internal();

    when(mockRepository.create(any, any)).thenAnswer((invocation) {
      _scope = MockRepositoryScope();
      return _scope;
    });
    when(mockRepository.containsScope()).thenAnswer((invocation) => _scope);
    when(mockRepository.runServiceAdapter(any, any))
        .thenAnswer((invocation) => Future.value(_entity));
    when(mockRepository.get(any)).thenAnswer((invocation) => _entity);
    return mockRepository;
  }

  void set mockEntity(value) => _entity = value;
  void set scope(value) => _scope = value;
  MockRepositoryScope get scope => _scope;
}

class MockEventPipe extends Mock implements EventPipe {}

class MockPipe<T> extends Mock implements Pipe<T> {
  MockPipe._internal();

  factory MockPipe() {
    final mockPipe = MockPipe<T>._internal();
    when(mockPipe.receive)
        .thenAnswer((invocation) => StreamController<T>().stream);
    return mockPipe;
  }
}

class MockRepositoryScope extends Fake implements RepositoryScope {
  Function(dynamic) subscription;
}
