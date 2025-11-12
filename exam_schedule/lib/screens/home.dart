import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_grid.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final List<Exam> _exams;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadExams();
  }

  void _loadExams() {
    final examData = [
      Exam(name: "Mobile Applications", date: DateTime(2026, 1, 20, 10, 0), rooms: ["Amphitheater TMF", "215"]),
      Exam(name: "Web Programming", date: DateTime(2026, 1, 22, 12, 30), rooms: ["1-21", "1-22"]),
      Exam(name: "Structured Programming", date: DateTime(2025, 10, 5, 9, 0), rooms: ["210"]),
      Exam(name: "Databases", date: DateTime(2026, 2, 2, 14, 0), rooms: ["Lab K1-1", "Lab K1-2"]),
      Exam(name: "Discrete Mathematics", date: DateTime(2025, 9, 15, 11, 0), rooms: ["Amphitheater 1"]),
      Exam(name: "Internet Technologies", date: DateTime(2026, 6, 10, 8, 30), rooms: ["Online"]),
      Exam(name: "Software Engineering", date: DateTime(2026, 6, 12, 13, 0), rooms: ["2-23"]),
      Exam(name: "Computer Networks", date: DateTime(2026, 6, 15, 9, 0), rooms: ["Networking Lab"]),
      Exam(name: "Algorithms and Data Structures", date: DateTime(2025, 11, 29, 15, 0), rooms: ["Amphitheater 2"]),
      Exam(name: "Operating Systems", date: DateTime(2026, 9, 1, 10, 0), rooms: ["1-25"]),
    ];

    examData.sort((a,b) => a.date.compareTo(b.date));

    setState(() {
      _exams = examData;
      _isLoading = false;
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
            "Exam Schedule - 223255",
            style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body:_isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ExamGrid(exams: _exams),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.indigo,
        height: 65.0,
        child: Container(
          height: 50.0,
          alignment: Alignment.center,
          child: Chip(
            label: Text(
              "Total exams: ${_exams.length}",
              style: const TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }

}