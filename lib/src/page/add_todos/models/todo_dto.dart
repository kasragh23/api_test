class TodoDto {
  final String title;
  final int userId;
  final bool isCompleted;

  TodoDto({
    required this.title,
    required this.userId,
    required this.isCompleted,
  });

  Map<String, dynamic> toJason() => {
    'userId' : userId,
    'title' : title,
    'complete' : isCompleted
  };
}
