class UserResponse {
  final int id;
  final String username;
  final String email;
  final CompanyResponse company;

  UserResponse({required this.id, required this.username, required this.email, required this.company});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        company: CompanyResponse.fromJson(json["company"])
    );
  }
}

class CompanyResponse {
  final String name;
  final String catchPhrase;

  CompanyResponse({required this.name, required this.catchPhrase});

  factory CompanyResponse.fromJson(Map<String, dynamic> json) {
    return CompanyResponse(
        name: json["name"],
        catchPhrase: json["catchPhrase"]
    );
  }
}