import 'package:flutter/material.dart';
import 'package:hello_world/data/entity/attendance_entity.dart';
import 'package:hello_world/data/entity/student_entity.dart';
import 'package:hello_world/data/sqflite/database_helper.dart';
import 'package:hello_world/screens/attendance_list/widgets/attendance_card_widget.dart';

class AttendanceListPage extends StatefulWidget {
  final StudentEntity studentEntity;
  const AttendanceListPage({super.key, required this.studentEntity});

  @override
  State<AttendanceListPage> createState() => _AttendanceListPageState();
}

class _AttendanceListPageState extends State<AttendanceListPage> {

  final DatabaseHelper _databaseHelper = DatabaseHelper.getInstance();
  final List<AttendanceEntity> _attendances = [];

  @override
  void initState() {
    _getAttendanceData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.studentEntity.name}'s Attendances"),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
                itemCount: _attendances.length,
                itemBuilder: (context, position) {
                  return AttendanceCardWidget(entity: _attendances[position]);
                }
            ),
          ),
        )
    );
  }

  void _getAttendanceData() async {
    var attendanceData = await _databaseHelper.getAllAttendancesByStudent(widget.studentEntity.id);
    _attendances.clear();
    _attendances.addAll(attendanceData);
    setState(() {
    });
  }
}
