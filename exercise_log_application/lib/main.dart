import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/exerciseSummery.dart';
import 'view/excerciseForm.dart';
import 'view/excerciseProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ExerciseProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise Logger',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  
  final List<Widget> _pages = [
    ExerciseForm(),
    SummaryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      //   items: const [
      //     BottomNavigationBar.item(
      //       icon: Icon(Icons.add),
      //       label: 'Add Exercise',
      //     ),
      //     BottomNavigationBar.item(
      //       icon: Icon(Icons.list),
      //       label: 'Summary',
      //     ),
      //   ],
      // ),
    );
  }
}