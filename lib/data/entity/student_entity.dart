class StudentEntity {

  final int id;
  final String name, email, hobby;

  StudentEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.hobby});

  factory StudentEntity.fromMap(Map<String, dynamic> map) {
    return StudentEntity(
        id: map[COL_ID_KEY],
        name: map[COL_NAME_KEY],
        email: map[COL_EMAIL_KEY],
        hobby: map[COL_HOBBY_KEY]
    );
  }

  Map<String, dynamic> toMap() {
    return {
      COL_ID_KEY: id,
      COL_NAME_KEY: name,
      COL_EMAIL_KEY: email,
      COL_HOBBY_KEY: hobby
    };
  }

  static String TABLE_NAME = "student";
  static String COL_ID_KEY = "id";
  static String COL_NAME_KEY = "name";
  static String COL_EMAIL_KEY = "email";
  static String COL_HOBBY_KEY = "hobby";

}