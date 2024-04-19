class AttendanceEntity {

  final int id, studentId, timestamp;

  AttendanceEntity({
    required this.id,
    required this.studentId,
    required this.timestamp});

  factory AttendanceEntity.fromMap(Map<String, dynamic> map) {
    return AttendanceEntity(
        id: map[COL_ID_KEY],
        studentId: map[COL_STUDENT_ID_KEY],
        timestamp: map[COL_TIMESTAMP_KEY]
    );
  }

  Map<String, dynamic> toMap() {
    return {
      COL_ID_KEY: id,
      COL_STUDENT_ID_KEY: studentId,
      COL_TIMESTAMP_KEY: timestamp
    };
  }

  static String TABLE_NAME = "attendances";
  static String COL_ID_KEY = "id";
  static String COL_STUDENT_ID_KEY = "name";
  static String COL_TIMESTAMP_KEY = "timestamp";

}