import 'package:flutter/foundation.dart';
import '../models/exercise.dart';

class ExerciseProvider with ChangeNotifier {
  List<Exercise> _exercises = [];
  
  List<Exercise> get exercises => _exercises;
  
  void addExercise(Exercise exercise) {
    _exercises.add(exercise);
    notifyListeners();
  }
}