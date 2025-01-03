import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../exercise/excerciseProvider.dart';

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExerciseProvider>(
      builder: (context, provider, child) {
        final exercises = provider.exercises;
        
        return Scaffold(
          appBar: AppBar(
            title: Text('Workout Summary'),
          ),
          body: Column(
            children: [
              Card(
                margin: EdgeInsets.all(16),
                child: ListTile(
                  title: Text(
                    'Total Exercises',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    '${exercises.length}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: exercises.isEmpty
                    ? Center(
                        child: Text('No exercises logged yet'),
                      )
                    : ListView.builder(
                        itemCount: exercises.length,
                        itemBuilder: (context, index) {
                          final exercise = exercises[index];
                          return Card(
                            margin: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: ListTile(
                              title: Text(
                                exercise.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sets: ${exercise.sets} | Reps: ${exercise.reps}',
                                  ),
                                  Text(
                                    'Rest: ${exercise.restTime} seconds',
                                  ),
                                  Text(
                                    DateFormat('MMM d, y').format(exercise.date),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}