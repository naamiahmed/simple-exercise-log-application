import 'package:exercise_log_application/models/exercise.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'excerciseProvider.dart';
import 'excerciseForm.dart';

class ExerciseListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Exercises'),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () => _showSortOptions(context),
          ),
        ],
      ),
      body: Consumer<ExerciseProvider>(
        builder: (context, provider, child) {
          if (provider.exercises.isEmpty) {
            return _buildEmptyState(context);
          }
          return _buildExerciseList(context, provider);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showExerciseForm(context),
        label: Text('Add Exercise'),
        icon: Icon(Icons.add),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.fitness_center, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No exercises added yet',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => _showExerciseForm(context),
            icon: Icon(Icons.add),
            label: Text('Add Your First Exercise'),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseList(BuildContext context, ExerciseProvider provider) {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: provider.exercises.length,
      itemBuilder: (context, index) {
        final exercise = provider.exercises[index];
        return Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.fitness_center, color: Colors.white),
            ),
            title: Text(
              exercise.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '${exercise.sets} sets × ${exercise.reps} reps\n'
              'Rest: ${exercise.restTime}s',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () => _startExercise(context, exercise),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteExercise(context, exercise, provider),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showExerciseForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExerciseForm()),
    );
  }

  void _startExercise(BuildContext context, Exercise exercise) {
    // TODO: Implement exercise timer
  }

  void _deleteExercise(BuildContext context, Exercise exercise, ExerciseProvider provider) {
    // TODO: Implement delete functionality
  }

  void _showSortOptions(BuildContext context) {
    // TODO: Implement sort options
  }
}