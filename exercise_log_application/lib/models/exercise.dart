class Exercise {
  final String id;
  final String name;
  final int sets;
  final int reps;
  final int restTime;
  final DateTime date;

  Exercise({
    required this.id,
    required this.name,
    required this.sets,
    required this.reps,
    required this.restTime,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'sets': sets,
    'reps': reps,
    'restTime': restTime,
    'date': date.toIso8601String(),
  };
}