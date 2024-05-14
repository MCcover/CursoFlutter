import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/domain/entities/todo.dart';
import 'package:uuid/uuid.dart';

part 'todos_providers.g.dart';

const uuid = Uuid();

enum FilterType { all, completed, pending }

@Riverpod(keepAlive: true)
class TodoCurrentFilter extends _$TodoCurrentFilter {
  @override
  FilterType build() {
    return FilterType.all;
  }

  void setFilter(FilterType filter) {
    state = filter;
  }
}

@Riverpod(keepAlive: true)
class Todos extends _$Todos {
  @override
  List<Todo> build() {
    return [
      Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null,
      ),
      Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null,
      ),
      Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: DateTime.now(),
      ),
      Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null,
      ),
      Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null,
      ),
      Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: DateTime.now(),
      ),
      Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null,
      ),
    ];
  }

  void createTodo() {
    var todo = Todo(
      id: uuid.v4(),
      description: RandomGenerator.getRandomName(),
      completedAt: null,
    );

    state = [...state, todo];
  }

  void toggleTodo(String id) {
    state = state.map((e) {
      var todo = e;
      if (e.id == id) {
        todo = e.copyWith(completedAt: todo.done ? null : DateTime.now());
      }
      return todo;
    }).toList();
  }
}

@riverpod
List<Todo> filteredTodos(FilteredTodosRef ref) {
  var list = ref.watch(todosProvider);

  final filter = ref.watch(todoCurrentFilterProvider);

  switch (filter) {
    case FilterType.all:
      list = list;
      break;
    case FilterType.completed:
      list = list.where((element) => element.done).toList();
      break;
    case FilterType.pending:
      list = list.where((element) => !element.done).toList();
      break;
  }

  return list;
}
