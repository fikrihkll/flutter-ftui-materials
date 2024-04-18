import 'package:flutter/material.dart';
import 'package:hello_world/data/entity/attendance_entity.dart';
import 'package:hello_world/data/entity/student_entity.dart';
import 'package:hello_world/data/sqflite/database_helper.dart';
import 'package:hello_world/screens/attendance_list/attendance_list_page.dart';
import 'package:hello_world/screens/home/widgets/student_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final DatabaseHelper _databaseHelper = DatabaseHelper.getInstance();

  final List<StudentEntity> _students = [];

  final TextEditingController _idTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _hobbyTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _idTextController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Student ID"),
                ),
                TextField(
                  controller: _nameTextController,
                  decoration: const InputDecoration(hintText: "Name"),
                ),
                TextField(
                  controller: _emailTextController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: "Email"),
                ),
                TextField(
                  controller: _hobbyTextController,
                  decoration: const InputDecoration(hintText: "Hobby"),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                        child: Text("Register Student"),
                        color: Colors.blue,
                        onPressed: () {
                          _registerNewStudent();
                        }
                    ),
                    MaterialButton(
                        child: Text("Update Student"),
                        color: Colors.blue,
                        onPressed: () {
                          _updateStudentData();
                        }
                    ),
                  ],
                ),
                MaterialButton(
                    child: Text("Get All Students"),
                    color: Colors.blue,
                    onPressed: () {
                      _getAllStudentsData();
                    }
                ),
                const SizedBox(height: 16),
                Text("All Students", style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 16),
                ListView.builder(
                    itemCount: _students.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, position) {
                      return StudentCardWidget(
                          entity: _students[position],
                          onCardClicked: _onStudentCardClicked,
                          onUpdatePressed: _onUpdateRequested,
                          onDeletePressed: _onDeleteRequested,
                          onAddAttendancePressed: _onAddAttendanceRequested,
                      );
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  bool _areAllInputsValid() {
    if (_idTextController.value.text.isEmpty) return false;
    if (_nameTextController.value.text.isEmpty) return false;
    if (_emailTextController.value.text.isEmpty) return false;
    if (_hobbyTextController.value.text.isEmpty) return false;

    return true;
  }

  Future<void> _registerNewStudent() async {
    if (!_areAllInputsValid()) {
      _showMessage("Mohon isi semua kolom");
      return;
    }

    StudentEntity newStudentEntity = StudentEntity(
        id: int.parse(_idTextController.value.text),
        name: _nameTextController.value.text,
        email: _emailTextController.value.text,
        hobby: _hobbyTextController.value.text);
    bool updateResult = await _databaseHelper.createStudent(newStudentEntity);
    if (updateResult) {
      _clearForms();
      _showMessage("Berhasil registrasi data student ${newStudentEntity.name}");
    } else {
      _showMessage("Gagal registrasi student");
    }
  }

  Future<void> _updateStudentData() async {
    if (!_areAllInputsValid()) {
      _showMessage("Mohon isi semua kolom");
      return;
    }

    StudentEntity newStudentEntity = StudentEntity(
        id: int.parse(_idTextController.value.text), 
        name: _nameTextController.value.text, 
        email: _emailTextController.value.text,
        hobby: _hobbyTextController.value.text);
    bool updateResult = await _databaseHelper.updateStudent(newStudentEntity);
    if (updateResult) {
      _clearForms();
      _showMessage("Berhasil update data student ${newStudentEntity.name}");
    } else {
      _showMessage("Gagal update data");
    }
  }
  
  void _getAllStudentsData() async {
    var studentData = await _databaseHelper.getAllStudents();
    _students.clear();
    _students.addAll(studentData);
    setState(() {
    });
  }

  void _onStudentCardClicked(StudentEntity entity) {
    Navigator.push(context, MaterialPageRoute(
        builder: (_) => AttendanceListPage(studentEntity: entity)));
  }

  void _onUpdateRequested(StudentEntity entity) {
    _idTextController.text = entity.id.toString();
    _nameTextController.text = entity.name.toString();
    _emailTextController.text = entity.email.toString();
    _hobbyTextController.text = entity.hobby.toString();
    setState(() {
    });
  }

  void _onDeleteRequested(StudentEntity entity) async {
    await _databaseHelper.deleteStudent(entity.id);
    _students.removeWhere((element) => element.id == entity.id);
    setState(() {
    });
  }

  void _onAddAttendanceRequested(StudentEntity studentEntity) async {
    var attendanceAdditionResult = await _databaseHelper.createAttendance(
        AttendanceEntity(
            id: 0,
            studentId: studentEntity.id,
            timestamp: DateTime.now().millisecondsSinceEpoch));
    if (attendanceAdditionResult) {
      _showMessage("Berhasil menambahkan attendance ${studentEntity.name}");
    } else {
      _showMessage("Gagal menambahkan attendance");
    }
  }

  void _clearForms() {
    _idTextController.clear();
    _nameTextController.clear();
    _emailTextController.clear();
    _hobbyTextController.clear();
  }

  void _showMessage(String message) {
    ScaffoldMessenger
        .of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

}
