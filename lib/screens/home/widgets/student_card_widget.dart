import 'package:flutter/material.dart';
import 'package:hello_world/data/entity/student_entity.dart';

class StudentCardWidget extends StatelessWidget {

  final Function(StudentEntity) onCardClicked;
  final Function(StudentEntity) onUpdatePressed;
  final Function(StudentEntity) onDeletePressed;
  final Function(StudentEntity) onAddAttendancePressed;
  final StudentEntity entity;
  const StudentCardWidget({
    super.key,
    required this.entity,
    required this.onCardClicked,
    required this.onUpdatePressed,
    required this.onDeletePressed,
    required this.onAddAttendancePressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade300, offset: const Offset(0.6, 0.5), blurRadius: 4.5)
          ]
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text(entity.name)),
                Text("ID: ${entity.id}")
              ],
            ),
            Text("Email: ${entity.email}"),
            Text("Hobby: ${entity.hobby}"),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      onUpdatePressed(entity);
                    },
                    icon: const Icon(Icons.edit)
                ),
                IconButton(
                    onPressed: () {
                      onDeletePressed(entity);
                    },
                    icon: const Icon(Icons.delete)
                ),
                IconButton(
                    onPressed: () {
                      onAddAttendancePressed(entity);
                    },
                    icon: const Icon(Icons.add)
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void onClicked() {
    onCardClicked(entity);
  }
}
