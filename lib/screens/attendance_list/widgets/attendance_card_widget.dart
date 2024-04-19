import 'package:flutter/material.dart';
import 'package:hello_world/data/entity/attendance_entity.dart';
import 'package:intl/intl.dart';

class AttendanceCardWidget extends StatelessWidget {

  final AttendanceEntity entity;
  final DateFormat _dateFormat = DateFormat("EEE, yyyy-MM-dd HH:mm");

  AttendanceCardWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.fromBorderSide(BorderSide(color: Colors.grey.shade600))
      ),
      child: Column(
        children: [
          Text("Attendance ID: ${entity.id}"),
          Text("Student ID: ${entity.studentId}"),
          Text("Timestamp: ${_dateFormat.format(DateTime.fromMillisecondsSinceEpoch(entity.timestamp))}"),
        ],
      ),
    );
  }
}
