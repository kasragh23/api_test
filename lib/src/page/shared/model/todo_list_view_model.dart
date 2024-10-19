class TodoListViewModel {
  final int userId, id;
  final String title;
  final bool isCompleted;

  TodoListViewModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  factory TodoListViewModel.fromJson(final Map<String, dynamic> json) =>
      TodoListViewModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        isCompleted: json['completed'],
      );
}
