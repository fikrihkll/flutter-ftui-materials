
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "username")
  final String username;

  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "company")
  final CompanyResponse company;

  UserResponse(this.id, this.username, this.email, this.company);

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class CompanyResponse {
  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "catchPhrase")
  final String catchPhrase;

  CompanyResponse(this.name, this.catchPhrase);

  factory CompanyResponse.fromJson(Map<String, dynamic> json) => _$CompanyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyResponseToJson(this);
}