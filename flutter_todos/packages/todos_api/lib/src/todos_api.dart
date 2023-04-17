import 'package:todos_api/todos_api.dart';

/// {@template todos_api}
/// The interface and models for an API providing access to todos.
/// {@endtemplate}
abstract class TodosApi {
  /// {@macro todos_api}
  const TodosApi();

  /// Provides a [Stream] of all todos
  Stream<List<Todo>> getTodos();

  /// Save a [Todo]
  /// If a [Todo] with the same id already existed. It will be replaced
  Future<void> saveTodo(Todo todo);

  ///Delete the 'Todo' with the given id
  /// If no 'todo' with the given id existed. a [TodoNotFoundException] error
  /// is thrown.
  Future<void> deleteTodo(String id);

  /// Delete all completed Todos
  /// Return the number of deleted todos
  Future<int> clearCompleted();

  ///Sets the 'isCompleted' state of all todos to the given value
  ///Return number of updated todos
  Future<int> completeAll({required bool isCompleted});
}

// ignore: public_member_api_docs
class TodoNotFoundException implements Exception {}
