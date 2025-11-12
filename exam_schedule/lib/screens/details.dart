import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class DetailsPage extends StatelessWidget {
  final Exam exam;
  const DetailsPage({Key? key, required this.exam}) : super(key: key);

  String _getTimeRemaining() {
    final now = DateTime.now();
    if(exam.date.isBefore(now)) {
      return "The exam has finished.";
    }
    final difference = exam.date.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours % 24;

    return "$days days, $hours hours.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                exam.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildDetailRow(
                      icon: Icons.calendar_today,
                      label: "Date:",
                      value: DateFormat('MMMM dd, yyyy').format(exam.date),
                    ),
                    const SizedBox(height: 15),
                    _buildDetailRow(
                      icon: Icons.access_time_filled,
                      label: "Time:",
                      value: DateFormat('hh:mm a').format(exam.date),
                    ),
                    const SizedBox(height: 15),
                    _buildDetailRow(
                      icon: Icons.location_on,
                      label: "Rooms:",
                      value: exam.rooms.join(', '),
                    ),
                    const SizedBox(height: 20),

                    const Divider(thickness: 1),
                    const SizedBox(height: 20),
                    _buildDetailRow(
                      icon: Icons.timer,
                      label: "Remaining:",
                      value: _getTimeRemaining(),
                      isBold: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDetailRow({required IconData icon, required String label, required String value, bool isBold = false}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, color: Colors.indigo, size: 24),
      const SizedBox(width: 15),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    ],
  );
}
