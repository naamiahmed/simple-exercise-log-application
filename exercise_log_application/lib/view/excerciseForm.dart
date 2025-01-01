import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/exercise.dart';
import './excerciseProvider.dart';

class ExerciseForm extends StatefulWidget {
  @override
  _ExerciseFormState createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _setsController = TextEditingController();
  final _repsController = TextEditingController();
  final _restController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Exercise'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Exercise Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => 
                    value!.isEmpty ? 'Please enter a name' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _setsController,
                decoration: InputDecoration(
                  labelText: 'Sets',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => 
                    value!.isEmpty ? 'Please enter sets' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _repsController,
                decoration: InputDecoration(
                  labelText: 'Reps',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => 
                    value!.isEmpty ? 'Please enter reps' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _restController,
                decoration: InputDecoration(
                  labelText: 'Rest Time (seconds)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => 
                    value!.isEmpty ? 'Please enter rest time' : null,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Save Exercise'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final exercise = Exercise(
        id: DateTime.now().toString(),
        name: _nameController.text,
        sets: int.parse(_setsController.text),
        reps: int.parse(_repsController.text),
        restTime: int.parse(_restController.text),
        date: DateTime.now(),
      );
      
      Provider.of<ExerciseProvider>(context, listen: false)
          .addExercise(exercise);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Exercise saved successfully')),
      );
      
      _nameController.clear();
      _setsController.clear();
      _repsController.clear();
      _restController.clear();
    }
  }
}