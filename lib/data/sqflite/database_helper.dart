import 'package:flutter/material.dart';
import 'package:hello_world/data/entity/attendance_entity.dart';
import 'package:hello_world/data/entity/student_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  DatabaseHelper._privateConstructor();

  late Database _database;

  static Future<void> initDatabase() async {
    String path = join(await getDatabasesPath(), _DATABASE_NAME);
    getInstance()._database = await openDatabase(path, version: _DATABASE_VERSION,
        onCreate: (db, version) async {
          await db.execute('''
          CREATE TABLE ${StudentEntity.TABLE_NAME} (
            ${StudentEntity.COL_ID_KEY} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${StudentEntity.COL_NAME_KEY} TEXT NOT NULL,
            ${StudentEntity.COL_EMAIL_KEY} TEXT NOT NULL,
            ${StudentEntity.COL_HOBBY_KEY} TEXT NOT NULL
          )
          ''');

          await db.execute('''
          CREATE TABLE ${AttendanceEntity.TABLE_NAME} (
            ${AttendanceEntity.COL_ID_KEY} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${AttendanceEntity.COL_STUDENT_ID_KEY} INTEGER NOT NULL,
            ${AttendanceEntity.COL_TIMESTAMP_KEY} INTEGER NOT NULL
          )
          ''');
        });
  }

  Future<bool> createStudent(StudentEntity entity) async {
    var studentMap = entity.toMap();
    
    if (studentMap[StudentEntity.COL_ID_KEY] == 0) {
      studentMap[StudentEntity.COL_ID_KEY] = null;
    }

    try {
      await _database.insert(StudentEntity.TABLE_NAME, studentMap);
      return true;
    } catch(exception) {
      debugPrint("Error DB: $exception");
      return false;
    }
  }

  Future<bool> deleteStudent(int studentId) async {
    try {
      await _database.delete(
          StudentEntity.TABLE_NAME,
          where: "${StudentEntity.COL_ID_KEY} = ?",
          whereArgs: [studentId]
      );
      return true;
    } catch(exception) {
      debugPrint("Error DB: $exception");
      return false;
    }
  }

  Future<bool> updateStudent(StudentEntity entity) async {
    try {
      int rowAffected = await _database.update(
          StudentEntity.TABLE_NAME,
          entity.toMap(),
          where: "${StudentEntity.COL_ID_KEY} = ?",
          whereArgs: [entity.id]
      );

      return rowAffected > 0;
    } catch(exception) {
      debugPrint("Error DB: $exception");
      return false;
    }
  }

  Future<StudentEntity?> getStudent(int id) async {
    try {
      var queryResult = await _database.rawQuery(
          "SELECT * FROM ${StudentEntity.TABLE_NAME} WHERE ${StudentEntity.COL_ID_KEY} = ?",
        [id]
      );

      if (queryResult.isNotEmpty) {
        StudentEntity entity = StudentEntity.fromMap(queryResult.first);
        return entity;
      }

      return null;
    } catch(exception) {
      debugPrint("Error DB: $exception");
      return null;
    }
  }

  Future<List<StudentEntity>> getAllStudents() async {
    try {
      var queryResult = await _database.rawQuery(
          "SELECT * FROM ${StudentEntity.TABLE_NAME}",
          []
      );

      return queryResult.map((e) => StudentEntity.fromMap(e)).toList();
    } catch(exception) {
      debugPrint("Error DB: $exception");
      return [];
    }
  }

  Future<bool> createAttendance(AttendanceEntity entity) async {
    var attendanceMap = entity.toMap();
   
    if (attendanceMap[AttendanceEntity.COL_ID_KEY] == 0) {
      attendanceMap[AttendanceEntity.COL_ID_KEY] = null;
    }
    
    StudentEntity? existingStudent = await getStudent(entity.studentId);
    if (existingStudent == null) {
      debugPrint("student dengan id ${entity.id} tidak terdaftar");
      return false;
    }
    
    try {
      await _database.insert(AttendanceEntity.TABLE_NAME, attendanceMap);
      return true;
    } catch(exception) {
      debugPrint("Error DB: $exception");
      return false;
    }
  }

  Future<List<AttendanceEntity>> getAllAttendancesByStudent(int studentId) async {
    try {
      var queryResult = await _database.rawQuery(
          "SELECT * FROM ${AttendanceEntity.TABLE_NAME} WHERE ${AttendanceEntity.COL_STUDENT_ID_KEY} = ?",
          [studentId]
      );

      return queryResult.map((e) => AttendanceEntity.fromMap(e)).toList();
    } catch(exception) {
      debugPrint("Error DB: $exception");
      return [];
    }
  }

  static String _DATABASE_NAME = "student.db";
  static int _DATABASE_VERSION = 1;
  static DatabaseHelper? _instance;
  static DatabaseHelper getInstance() {
    _instance ??= DatabaseHelper._privateConstructor();
    return _instance!;
  }

}