class UserResponse {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String token;

  UserResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.token,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        token: json["token"]
    );
  }
}
