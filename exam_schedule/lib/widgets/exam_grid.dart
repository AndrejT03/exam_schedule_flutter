import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'exam_card.dart';

class ExamGrid extends StatefulWidget {
  final List<Exam> exams;

  const ExamGrid({super.key, required this.exams});

  @override
  State<StatefulWidget> createState() => _ExamsGridState();
}

class _ExamsGridState extends State<ExamGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(5.0),

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        mainAxisExtent: 140,
        childAspectRatio: 3 / 1,
      ),

      itemCount: widget.exams.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ExamCard(exam: widget.exams[index]);
      },
    );
  }
}