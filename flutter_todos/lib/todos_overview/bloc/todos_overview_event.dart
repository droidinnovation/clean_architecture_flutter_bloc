part of 'todos_overview_bloc.dart';

/* TodosOverviewSubscriptionRequested: This is the startup event. In response, the bloc subscribes to the stream of todos from the TodosRepository.
_TodosOverviewTodoDeleted: This deletes a Todo.
_TodosOverviewTodoCompletionToggled: This toggles a todo's completed status.
_TodosOverviewToggleAllRequested: This toggles completion for all todos.
_TodosOverviewClearCompletedRequested: This deletes all completed todos.
_TodosOverviewUndoDeletionRequested: This undoes a todo deletion, e.g. an accidental deletion.
_TodosOverviewFilterChanged: This takes a TodosViewFilter as an argument and changes the view by applying a filter. */

abstract class TodosOverviewEvent extends Equatable {
  const TodosOverviewEvent();

  @override
  List<Object> get props => [];
}

class TodosOverviewSubscriptionRequested extends TodosOverviewEvent {
  const TodosOverviewSubscriptionRequested();
}

class TodosOverviewTodoCompletionToggled extends TodosOverviewEvent {
  const TodosOverviewTodoCompletionToggled({
    required this.todo,
    required this.isCompleted,
  });

  final Todo todo;
  final bool isCompleted;

  @override
  List<Object> get props => [todo, isCompleted];
}

class TodosOverviewTodoDeleted extends TodosOverviewEvent {
  const TodosOverviewTodoDeleted(this.todo);

  final Todo todo;
}

class TodosOverviewUndoDeletionRequested extends TodosOverviewEvent {
  const TodosOverviewUndoDeletionRequested();
}

class TodosOverviewToggleAllRequested extends TodosOverviewEvent {
  const TodosOverviewToggleAllRequested();
}

class TodosOverviewClearCompletedRequested extends TodosOverviewEvent {
  const TodosOverviewClearCompletedRequested();
}

class TodosOverviewFilterChanged extends TodosOverviewEvent {
  const TodosOverviewFilterChanged(this.filter);

  final TodosViewFilter filter;

  @override
  List<Object> get props => [filter];
}
